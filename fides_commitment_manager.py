#from commitment_management_crew import crew1

import streamlit as st
import os
from pathlib import Path
import json

# set_page_config must be the first Streamlit command
st.set_page_config(page_title="ZKP Program Metadata Form", layout="centered")


# Inject custom CSS to style the sidebar
st.markdown(
    """
    <style>
    /* Sidebar styling */
    [data-testid="stSidebar"] {
        background-color: #1f4e79 !important;  /* Professional sidebar blue */
        width: 300px !important;
    }

    [data-testid="stSidebarContent"] {
        width: 300px !important;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: flex-start;
    }

    /* Optional: spacing adjustments */
    .css-1d391kg { padding: 1rem; }
    </style>
    """,
    unsafe_allow_html=True
)

# Sidebar content: centered logo, title, and external links
with st.sidebar:
    st.markdown(
        """
        <div style="text-align: center;">
            <img src="https://panel.zksensor.tech/img/logo/logo-dark-full.png" width="250">
            <div style="font-size: 28px; font-weight: bold; margin-top: 14px; color: white;">
                Fides Innova<br>ZKP Commitment Generator Agent
            </div>
        </div>
        """,
        unsafe_allow_html=True
    )

    st.markdown("---", unsafe_allow_html=True)

 #   st.markdown("### 🔗 Links", unsafe_allow_html=True)
    st.markdown(
        """
        <div style="color:white">
        <h3>🔗 Links</h3>
        <ul>
            <li><a href="https://www.fidesinnova.io" target="_blank" style="color:white;">🌐 Fides Innova Website</a></li>
            <li><a href="https://x.com/fidesinnova" target="_blank" style="color:white;">🐦 Fides Innova on X</a></li>
            <li><a href="https://www.youtube.com/@fidesinnova" target="_blank" style="color:white;">📺 YouTube Channel</a></li>
            <li><a href="https://github.com/TheArchitect2000/iot-server" target="_blank" style="color:white;">💻 GitHub IoT Server</a></li>
            <li><a href="https://github.com/TheArchitect2000/zkiot-arm-siemens-iot2050-c" target="_blank" style="color:white;">💻 ZKP Device Integration</a></li>
            <li><a href="https://github.com/TheArchitect2000/Fides-Innova-WiKi?tab=readme-ov-file#fidesinnova-wiki" target="_blank" style="color:white;">📘 Wiki</a></li>
        </ul>
        </div>""",
        unsafe_allow_html=True
    )


st.title("ZKP Commitment Generator Agent")

st.markdown("Please upload your program file and fill in the fields below.")

# File uploader for program file
uploaded_file = st.file_uploader("Upload your program file (.cpp or .py)", type=["cpp", "py"])

# Target processor selection
processor = st.selectbox("Choose your target processor", ["RISC-V", "ARM"], index=0)

# Store uploaded file in the current directory
program_name = ""
if uploaded_file is not None:
    program_name = uploaded_file.name
    with open(program_name, "wb") as f:
        f.write(uploaded_file.read())
    st.success(f"Uploaded and saved as {program_name}")

# Class input as a slider between 1 and 16
program_class = st.slider("ZKP class", min_value=1, max_value=16, value=1)

# Other metadata fields
device_type = st.text_input("Device type", value="Sensor")
device_id_type = st.text_input("Device ID type", value="MAC")
device_model = st.text_input("Device model", value="Siemens IOT2050")
manufacturer = st.text_input("Manufacturer", value="Fides")
software_version = st.text_input("Software version", value="1.0")
code_block = st.text_input("Code block", value="[14, 15]")


#################################################
#################################################
# The agent asks the developer a program file.
# {Program}{Language}
# If it's a C++ code, the agent will add the FidesZKP.h library to the user's program.cpp program and will save it as program_AddedFidesZKPLib.cpp
# If it's a Python code, the agent will add the Fides Python package to the user's program.py program and will save it as program_AddedFidesZKPLib.py
#
# {Processor}
# Then, the agent asks the developer to choose a target processor including RISC-V and ARM.
# Then, the agent compiles the code using g++ compiler for the target processor to generate an assembly file; program_AddedFidesZKP.s
# Then, the agent executes the commitmentGenerator file
# to create program_AddedFidesZKP_ZKPGen.s, program_AddedFidesZKP_Param.json, program_AddedFidesZKP_Commitment.json
#
# The agent returns program_AddedFidesZKP_ZKPGen.s, program_AddedFidesZKP_Param.json files to the developer.
# The agent uploads the program_AddedFidesZKP_Commitment.json on the Fides Innova blockchain using https://rpc.fidesinnova.io API and its own wallet.
#
# The agent return a link to the explorer to show the submitted commitment file, https://explorer.fidesinnova.io/xxxxxxxxxx
# The Fides Innova explorer shows the "CommitmentManagerAIAgent" name as the transaction submitter on the blockchain.

# --- Step 2: Load environment variables from .env file

# pip install crewai
# pip install langfuse
# pip install mlflow

import os
import base64
from dotenv import load_dotenv

load_dotenv()
os.environ["OPENAI_API_KEY"] = os.getenv("OPENAI_API_KEY")
os.environ["LANGCHAIN_API_KEY"]=os.getenv("LANGCHAIN_API_KEY")
os.environ["LANGCHAIN_PROJECT"]=os.getenv("LANGCHAIN_PROJECT")
os.environ["LANGCHAIN_TRACING_V2"]="true"

import sys
import subprocess
from crewai import Agent, Task, Crew
from crewai.tools import tool
from langchain_openai import ChatOpenAI


# Initialize the OpenAI model
llm_model = ChatOpenAI(
    model="gpt-4o-mini",
    temperature=0.1,
    max_tokens=4096,
    streaming=True,
)

import logging
logging.basicConfig(level=logging.INFO)

from langfuse import Langfuse

# host=os.getenv("LANGFUSE_API_URL")
LANGFUSE_PUBLIC_KEY = os.getenv("LANGFUSE_PUBLIC_KEY")
LANGFUSE_SECRET_KEY = os.getenv("LANGFUSE_SECRET_KEY")
LANGFUSE_AUTH=base64.b64encode(f"{LANGFUSE_PUBLIC_KEY}:{LANGFUSE_SECRET_KEY}".encode()).decode()

# os.environ["OTEL_EXPORTER_OTLP_TRACES_ENDPOINT"] = "https://cloud.langfuse.com/api/public/otel/v1/traces"  # 🇪🇺 EU data region
os.environ["OTEL_EXPORTER_OTLP_TRACES_ENDPOINT"] = "https://us.cloud.langfuse.com/api/public/otel/v1/traces"  # 🇺🇸 US data region
os.environ["OTEL_EXPORTER_OTLP_TRACES_HEADERS"] = f"Authorization=Basic {LANGFUSE_AUTH}"
os.environ['OTEL_EXPORTER_OTLP_TRACES_PROTOCOL']= "http/protobuf"

import mlflow
mlflow.crewai.autolog()

###########################
#### Device Config Agent

# Role, Goal, Backstory, LLm instance, Tool (optional)

# deviceConfigTool = tool()
# deviceConfigAgent = Agent(role="commitmentGenerator")
# deviceConfigTask = Task()

@tool("deviceConfigTool")
def deviceConfigTool(myJson: str) -> str:
    """
    Save the input myJson (stringified JSON) into device_config.json.
    """
    import json

    try:
        parsed = json.loads(myJson)
    except json.JSONDecodeError:
        st.error("❌ Error: Provided input is not valid JSON.")
        return "Error: Provided input is not valid JSON."

    # Save the config file
    config_path = "device_config.json"
    with open(config_path, "w+") as f:
        json.dump(parsed, f, indent=2)

    st.success("✅ Device config file updated successfully.")

    st.session_state["config_path"] = config_path
    return "✅ Device config file updated successfully."


deviceConfigAgent = Agent(
    role="device_config",
    goal=(
        "Create a JSON object called myJson with the following keys:\n"
        "- class: {class}\n"
        "- deviceType: {deviceType}\n"
        "- deviceIdType: {deviceIdType}\n"
        "- deviceModel: {deviceModel}\n"
        "- manufacturer: {manufacturer}\n"
        "- softwareVersion: {softwareVersion}\n"
        "- code_block: {code_block}\n"
        "Then call deviceConfigTool(myJson) to save it."
    ),
    backstory="You are responsible for creating device configs based on user inputs.",
    tools=[deviceConfigTool],
    llm=llm_model
)

deviceConfigTask = Task(
    agent=deviceConfigAgent,
    description=(
        "Generate a JSON object called myJson with the specified keys and values. "
        "Then invoke deviceConfigTool(myJson) to save it to device_config.json."
    ),
    expected_output="Print a message whether the device config file is updated or not."
)

#########################
#### Compiler Agent #####

@tool("CompilerTool")
def compilerTool(program: str) -> str:
    """
    Reads the user program, adds FidesZKP includes, compiles it to assembly,
    displays progress, and provides download buttons for output files.
    """
    from pathlib import Path

    filename = os.path.basename(program)
    base_name, ext = os.path.splitext(filename)
    ext = ext.lower()
    filename = base_name + ext

    if ext == ".py":
        language = "Python"
    elif ext == ".cpp":
        language = "C++"
    else:
        st.error(f"❌ Unsupported file extension: {ext}")
        raise ValueError("Unsupported file extension")

    st.write(f"📄 Detected language: **{language}**")

    with open(program, "r") as f1:
        program_code = f1.read()

    if language == "C++":
        new_line = '#include "lib/fidesinnova.h"\n'
        if new_line not in program_code:
            modified_code = new_line + program_code
        else:
            modified_code = program_code

        new_filename = f"{base_name}_AddedFidesZKPLib.cpp"
        with open(new_filename, "w") as f2:
            f2.write(modified_code)
        st.success(f"✅ Generated instrumented file: {new_filename}")

        asm_filename = f"{base_name}_AddedFidesZKPLib.s"
        command_to_execute = f"g++ -std=c++17 -S {new_filename} -o {asm_filename} -lstdc++"
        result = subprocess.run(command_to_execute.split(), capture_output=True, text=True)
        st.write(f"🔧 Executing: `{command_to_execute}`")

        if result.returncode != 0:
            st.error("❌ Compilation failed:")
            # st.code(result.stderr, language="bash")
            raise RuntimeError(
                f"Compilation failed!\nError Output:\n{result.stderr}"
            )

        st.success(f"✅ Compilation succeeded. Assembly file: {asm_filename}")
        st.session_state["asm_filename"] = asm_filename
        st.session_state["new_filename"] = new_filename

        return asm_filename

    else:
        st.error("Only C++ is supported for now")
        raise NotImplementedError("Only C++ is supported for now")
    
CompilerAgent = Agent(
    role="Compiler",
    goal="Execute the compilerTool tool. The default {program} filename is program.cpp if it's not set by the user. If there is any error, print the error for the user and provide some suggestions to fix it. Then, do not proceed with any other agent and stop the crew.",
    backstory="",
    tools=[compilerTool],
    allow_delegation=True,
    llm=llm_model
)

CompileTask = Task(
    agent=CompilerAgent,
    description="Process the user's program file {program} with compilerTool.",
    expected_output=(
        "If there is no error from the g++ compilation command, then return only the assembly output filename resulting from execution of the g++ compiler. "
        "If there is any error, print the error for the user and provide some suggestions to fix it. Then, do not proceed with any other agent and stop the crew."
    ),
)

################################
### Commitment Generator Agent

# Role, Goal, Backstory, LLm instance, Tool (optional)
# commitmentGeneratorTool = tool()
# commitmentGeneratorAgent = Agent(role="commitmentGenerator")
# commitmentGeneratorTask = Task()

# execute:
# commitmentGenerator-method2-ubuntu program_AddedFidesZKPLib.s
# commitmentGenerator-method2-Mac program_AddedFidesZKPLib.s

# Role, Goal, Backstory, LLm instance, Tool (optional)
@tool("operatingSystemTool")
def operatingSystemTool() -> str:
    """
    Detect the operating system and show result using Streamlit.
    """

    os_type = "Unknown"
    if sys.platform.startswith('linux'):
        if os.path.exists('/etc/lsb-release'):
            with open('/etc/lsb-release', 'r') as f:
                content = f.read()
                if 'DISTRIB_ID=Ubuntu' in content:
                    os_type = "Ubuntu"
                else:
                    os_type = "Linux (Other)"
        else:
            os_type = "Linux (Likely)"
    elif sys.platform == 'darwin':
        os_type = "macOS"
    else:
        os_type = "Other OS"

    st.info(f"🖥️ Detected Operating System: `{os_type}`")
    return os_type

@tool("commitmentGeneratorOnMacTool")
def commitmentGeneratorOnMacTool(program: str) -> str:
    """
    Run the commitment generator on macOS and display results in Streamlit.
    """

    command_to_execute = f"./commitmentGenerator-method2-Mac {program}"
    st.write(f"🛠️ Executing: `{command_to_execute}`")

    result = subprocess.run(command_to_execute.split(), capture_output=True, text=True)

    if result.returncode != 0:
        st.error("❌ Commitment generation failed:")
        # st.code(result.stderr, language="bash")
        raise RuntimeError(
            f"Commitment Generation failed!\nError Output:\n{result.stderr}"
        )

    st.success("✅ Commitment generation completed.")
    # st.code(result.stdout)
    return result.stdout

@tool("commitmentGeneratorOnUbuntuTool")
def commitmentGeneratorOnUbuntuTool(program: str) -> str:
    """
    Run the commitment generator on Ubuntu and display results in Streamlit.
    """

    command_to_execute = f"./commitmentGenerator-method2-ubuntu {program}"
    st.write(f"🛠️ Executing: `{command_to_execute}`")

    result = subprocess.run(command_to_execute.split(), capture_output=True, text=True)

    if result.returncode != 0:
        st.error("❌ Commitment generation failed:")
        # st.code(result.stderr, language="bash")
        raise RuntimeError(
            f"Commitment Generation failed!\nError Output:\n{result.stderr}"
        )

    st.success("✅ Commitment generation completed.")
    # st.code(result.stdout)
    return result.stdout

commitmentGeneratorAgent = Agent(role="commitmentGenerator",
                                 goal = "If there is an error from the CompilerAgent output, then do nothing, do not execute any tool, and stop the crew. Otherwise, based on the return value of operatingSystemTool, find out which computer's operation system is currently running on the computer. If it's a macOS, execute commitmentGeneratorOnMacTool tool. The input for this tool is the output filename from the Compiler agent. If it's a Ubuntu, execute commitmentGeneratorOnUbuntuTool tool. The input for this tool is the output filename from the Compiler agent. Otherwise, tell the user that you support only macOS and Ubuntu platform at the moment and you do not have a tool for the current operating system.",
                                 backstory="",
                                 tools = [operatingSystemTool, commitmentGeneratorOnMacTool, commitmentGeneratorOnUbuntuTool],
                                 llm=llm_model
                                 )
FindingOperatingSystemTask = Task( agent = commitmentGeneratorAgent,
                               description = "Call the operatingSystemTool with the output of the Compiler agent as the input. Then, based on the output operatingSystemTool, determine the type of operating system.",
                               expected_output="Operating System type"
                               )
ExecutingCommitmentGeneratorTask = Task( agent = commitmentGeneratorAgent,
                               description = "Based on the output of the operatingSystemTool tool, choose which tool, commitmentGeneratorOnUbuntuTool or commitmentGeneratorOnLinuxTool or none, must be executed.",
                               expected_output="If the output of the tools is successful, return in a json format with keys 'commitmentFile' and 'paramFile' and 'finalAssemblyFile'. The values are the file name from the output of the tool. If there is an error, print the error for the user and provide some suggestions to fix it. Then, do not proceed with any other agent and stop the crew."
                               )

# Commitment Submitter Agent"""

import json
from web3 import Web3
import datetime
import uuid
import os

##########################################################
##########################################################
# Role, Goal, Backstory, LLm instance, Tool (optional)
# The commitmentUploader agent is responsible for uploading the program_AddedFidesZKP_Commitment.json file on the Fides Innova blockchain.
# The agent will use the Fides Innova API to upload the file.
# The agent will use the wallet address and private key to sign the transaction.
# The CommitmentStorage.sol smart contract is already deployed on the Fides Innova blockchain and its source code and ABI are available in the current folder.
# The agent will use its tool function to upload the program_AddedFidesZKP_Commitment.json file on the blockchain.
# the function storeCommitment function in the smart contract will be used mainly to upload the file.
# function storeCommitment(
#     string memory commitmentId,
#     string memory nodeId,
#     string memory deviceType,
#     string memory deviceIdType,
#     string memory deviceModel,
#     string memory manufacturer,
#     string memory softwareVersion,
#     string memory commitment,
#     uint256 timestamp
# ) public returns (bool) {
#     require(!commitmentIds[commitmentId], "commitmentId already registered.");


@tool("commitmentSubmitterTool")

def commitmentSubmitterTool(generatorAgentOutput: str):
    """Read the generatorAgentOutput from the output of the commitmentGenerator agent."""

    st.write("🔄 Reading output from Commitment Generator Agent...")
    # st.info("generatorAgentOutput: "+ str(generatorAgentOutput))
    # load the generatorAgentOutput
    generatorAgentOutput = json.loads(generatorAgentOutput)
    # get the commitment file name
    commitmentFile = generatorAgentOutput["commitmentFile"]
    # get the param file name
    paramFile = generatorAgentOutput["paramFile"]
    # get the final assembly file name
    finalAssemblyFile = generatorAgentOutput["finalAssemblyFile"]

    # check if the param file exists
    if not os.path.exists(paramFile):
        st.error(f"❌ Required param file not found: {paramFile}")
        raise FileNotFoundError(f"{paramFile} param file not found in the current directory.")
    else:
        st.success(f"✅ Required param file found: {paramFile}")
        with open(paramFile, "r") as f2:
            params = json.load(f2)
        # Check if the param data is valid
        if not isinstance(params, dict):
            st.error(f"❌ Invalid param file: {paramFile}. It should be a dictionary.")
            raise ValueError("Invalid param file. It should be a dictionary.")
        else:
            st.success(f"✅ {paramFile} file is valid.")
    # do the same checking for the final assembly file
    if not os.path.exists(finalAssemblyFile):
        st.error(f"❌ Required final assembly file not found: {finalAssemblyFile}")
        raise FileNotFoundError(f"{finalAssemblyFile} final assembly file not found in the current directory.")
    else:
        st.success(f"✅ Required final assembly file found: {finalAssemblyFile}")
    # print to let the user know that param file and final assembly files should be used on the device
    # st.info(f"Please create an executable from {finalAssemblyFile} to run on your device. Also, make sure to have the {paramFile} and {commitmentFile} files on the device.")


    # do the same checking for the commitment file
    # check if the commitment file exists
    if not os.path.exists(commitmentFile):
        st.error(f"❌ Required commitment file not found: {commitmentFile}")
        raise FileNotFoundError(f"{commitmentFile} file not found in the current directory.")
    else:
        st.success(f"✅ Required commitment file found: {commitmentFile}")
        
    # load the commitment file
    with open(commitmentFile, "r") as f1:
        commitmentData = f1.read()
    # Check if the commitment file is a valid json file
    try:
        json.loads(commitmentData)
    except json.JSONDecodeError:
        st.error("❌ Invalid commitment file. It should be a valid json file.")
        raise ValueError("Invalid commitment file. It should be a valid json file.")
    # Check if the commitment data is valid
    if not commitmentData:
        st.error("❌ Invalid commitment data. It should not be empty.")
        raise ValueError("Invalid commitment data. It should not be empty.")
    # Check if the commitment data is valid
    if len(commitmentData) > 1000000:
        st.error("❌ Invalid commitment data. It should not be larger than 1MB.")
        raise ValueError("Invalid commitment data. It should not be larger than 1MB.")
    # Check if the commitment data is valid
    if len(commitmentData) < 10:
        st.error("❌ Invalid commitment data. It should not be smaller than 10 bytes.")
        raise ValueError("Invalid commitment data. It should not be smaller than 10 bytes.")

    # do the same checking for the device_config.json file
    if not os.path.exists("device_config.json"):
        st.error(f"❌ Required device_config.json file not found.")
        raise FileNotFoundError(f"device_config.json file not found. Please make sure it is in the current directory.")
    else:
        st.success(f"✅ device_config.json file found.")
    # load the device_config.json file
    # Check if the device_config.json file is a valid json file
    try:
        with open("device_config.json", "r") as f2:
            device_config = json.load(f2)
    except json.JSONDecodeError:
        st.error("❌ Invalid device_config.json file. It should be a valid json file.")
        raise ValueError("Invalid device_config.json file. It should be a valid json file.")
    # Check if the device config data is valid
    if not isinstance(device_config, dict):
        st.error("❌ Invalid device config data. It should be a dictionary.")
        raise ValueError("Invalid device config data. It should be a dictionary.")
    # Check if the commitment data is valid
    required_keys = [
        "deviceType",
        "deviceIdType",
        "deviceModel",
        "manufacturer",
        "softwareVersion"
    ]
    for key in required_keys:
        if key not in device_config:
            st.error(f"❌ Missing required key in device config data: {key}")
            raise ValueError(f"Missing required key in device config data: {key}")
        if not isinstance(device_config[key], str):
            st.error(f"❌ Invalid value for key {key} in device config data. It should be a string.")
            raise ValueError(f"Invalid value for key {key} in device config data. It should be a string.")
    # Check if the device_config are valid
    if not device_config["class"]:
        st.error("❌ Invalid class. It should not be empty.")
        raise ValueError("Invalid class. It should not be empty.")
    if not isinstance(device_config["class"], int):
        st.error("❌ Invalid class. It should be an integer.")
        raise ValueError("Invalid class. It should be an integer.")
    # Check if the device_config are valid
    if device_config["class"] > 30:
        st.error("❌ Invalid class. It should not be larger than 30.")
        raise ValueError("Invalid class. It should not be larger than 30.")
    # Check if the device_config are valid
    if device_config["class"] < 1:
        st.error("❌ Invalid class. It should not be smaller than 1.")
        raise ValueError("Invalid class. It should not be smaller than 1.")


    # Call the polite agent to make sure all the used strings do not have an impolite or rude words and phrases. Also, the are not offensive As they are going to be registered on the blockchain forever.


    # print to let the user know that now this tool will upload the commitment file should be uploaded on the blockchain
    st.success(f"Now this tool will upload the {commitmentFile} file on the blockchain.")

    # load the environment variables from the .env file for the blockchain operations
    Blockchain_Name = os.getenv("Blockchain_Name")
    Blockchain_Symbol = os.getenv("Blockchain_Symbol")
    Blockchain_ID = int(os.getenv("Blockchain_ID"))
    Blockchain_API_Provider = os.getenv("Blockchain_API_Provider")
    Blockchain_Commitment_Smart_Contract_Address = os.getenv("Blockchain_Commitment_Smart_Contract_Address")

    Submitter_Wallet_Address = os.getenv("Submitter_Wallet_Address")
    # st.info(f"Submitter_Wallet_Address: {Submitter_Wallet_Address}")
    Submitter_Wallet_Private_Key = os.getenv("Submitter_Wallet_Private_Key")

    # Convert to checksum format and validate the addresses
    try:
        Submitter_Wallet_Address = Web3.to_checksum_address(Submitter_Wallet_Address)
        st.success(f"Submitter_Wallet_Address is correct: {Submitter_Wallet_Address}")
        Blockchain_Commitment_Smart_Contract_Address = Web3.to_checksum_address(Blockchain_Commitment_Smart_Contract_Address)
        st.success(f"Blockchain_Commitment_Smart_Contract_Address is correct: {Blockchain_Commitment_Smart_Contract_Address}")

    except Exception as e:
        st.error(f"❌ Invalid Ethereum address format: {e}")
        raise ValueError(f"❌ Invalid Ethereum address format: {e}")

    # check if the CommitmentStorage.abi file exists
    if not os.path.exists("CommitmentStorage.abi"):
        st.error(f"❌ Required CommitmentStorage.abi file not found.")
        raise FileNotFoundError("CommitmentStorage.abi file not found. Please make sure it is in the current directory.")
    else:
        st.success(f"✅ Required CommitmentStorage.abi file found.")


        # upload the commitmentFile file on the Fides Innova blockchain using the Fides Innova API
        # The API endpoint is Blockchain_API_Provider
        # All the parameters are passed to the function 'storeCommitment' in the smart contract with the ABI CommitmentStorage.abi
        # The function storeCommitment in the smart contract will be used to upload the commitmentFile.

        # Connect to Fides Innova blockchain
        w3 = Web3(Web3.HTTPProvider(Blockchain_API_Provider))

        # Check if the submitter wallet address is valid(
        if Submitter_Wallet_Address and not isinstance(Submitter_Wallet_Address, str):
            st.error("Invalid submitter wallet address. It should be a string.")
            raise ValueError("Invalid submitter wallet address. It should be a string.")
        # Check if the wallet address is valid
        if not w3.is_address(Submitter_Wallet_Address):
            st.error("Invalid wallet address.")
            raise ValueError("Invalid wallet address.")
        # Check if the submitter wallet private key is valid
        if Submitter_Wallet_Private_Key and not isinstance(Submitter_Wallet_Private_Key, str):
            st.error("Invalid submitter wallet private key. It should be a string.")
            raise ValueError("Invalid submitter wallet private key. It should be a string.")
        # Check if the smart contract address is valid
        if not w3.is_address(Blockchain_Commitment_Smart_Contract_Address):
            st.error("Invalid smart contract address.")
            raise ValueError("Invalid smart contract address.")
        # Check if the blockchain ID is valid
        if Blockchain_ID and not isinstance(Blockchain_ID, int):
            st.error("Invalid blockchain ID. It should be an integer.")
            raise ValueError("Invalid blockchain ID. It should be an integer.")
        # Check if the blockchain name is valid
        if Blockchain_Name and not isinstance(Blockchain_Name, str):
            st.error("Invalid blockchain name. It should be a string.")
            raise ValueError("Invalid blockchain name. It should be a string.")
        # Check if the blockchain symbol is valid
        if Blockchain_Symbol and not isinstance(Blockchain_Symbol, str):
            st.error("Invalid blockchain symbol. It should be a string.")
            raise ValueError("Invalid blockchain symbol. It should be a string.")
        # Check if the blockchain API provider is valid
        if Blockchain_API_Provider and not isinstance(Blockchain_API_Provider, str):
            st.error("Invalid blockchain API provider. It should be a string.")
            raise ValueError("Invalid blockchain API provider. It should be a string.")
        # Check if the blockchain commitment smart contract address is valid
        if Blockchain_Commitment_Smart_Contract_Address and not isinstance(Blockchain_Commitment_Smart_Contract_Address, str):
            st.error("Invalid blockchain commitment smart contract address. It should be a string.")
            raise ValueError("Invalid blockchain commitment smart contract address. It should be a string.")

        # print all the environment variables to let the user know that they are set
        st.markdown(f"""
        - **Blockchain Name**: {Blockchain_Name}  
        - **Blockchain Symbol**: {Blockchain_Symbol}  
        - **Blockchain ID**: {Blockchain_ID}  
        - **API Provider**: {Blockchain_API_Provider}  
        - **Smart Contract Address**: {Blockchain_Commitment_Smart_Contract_Address}
        """)

        # Load contract ABI
        with open("CommitmentStorage.abi", "r") as abi_file:
            contract_abi = json.load(abi_file)

        contract = w3.eth.contract(
            address=Web3.to_checksum_address(Blockchain_Commitment_Smart_Contract_Address),
            abi=contract_abi
        )

        # Check if connected to the blockchain
        if not w3.is_connected():
            st.error("Failed to connect to the Fides Innova blockchain.")
            raise ConnectionError("Failed to connect to the Fides Innova blockchain.")

        # Check if the AgentAIMiniCode_AddedFidesZKPLib_commitment.json file exists
        if not os.path.exists(commitmentFile):
            st.error(f"❌ Required commitment file not found: {commitmentFile}")
            raise FileNotFoundError(f"{commitmentFile} file not found. Please make sure it is in the current directory.")
        # read the commitment_id from the commitmentId in the AgentAIMiniCode_AddedFidesZKPLib_commitment.json file
        with open(commitmentFile, "r") as f1:
            commitmentData = json.load(f1)
        commitment_id = commitmentData.get("commitmentId")
        if not commitment_id:
            st.error("Invalid commitment file. It should contain a commitmentId field.")
            raise ValueError("Invalid commitment file. It should contain a commitmentId field.")

        # commitment_id = str(uuid.uuid4())

        # get the current timestamp
        now = datetime.datetime.now()

        # print all the input parameters
        st.markdown(f"""
        - **Commitment ID**: {commitment_id}  
        - **Device Type**: {device_config['deviceType']}  
        - **Device ID Type**: {device_config['deviceIdType']}  
        - **Device Model**: {device_config['deviceModel']}  
        - **Manufacturer**: {device_config['manufacturer']}  
        - **Software Version**: {device_config['softwareVersion']}  
        - **Timestamp**: {int(now.timestamp())}
        """)

        # # change all " characters in the commitmentData to '
        # commitmentData = commitmentData.replace('"', "'")
        # # Also, add backslash before all commas which are inside the brackets
        # commitmentData = commitmentData.replace(",", "\,")

        # Make sure the commitmentData is properly serialized JSON
        commitmentData = json.dumps(commitmentData)  # re-serialize it

        # write all the input data to storeCommitmnt function and also the commitmentData to a file
        # with open(f"commitment_{commitment_id}.json", "w") as f:
        #     f.write(f"Commitment ID: {commitment_id}\n")
        #     f.write(f"Device Type: {device_config['deviceType']}\n")
        #     f.write(f"Device ID Type: {device_config['deviceIdType']}\n")
        #     f.write(f"Device Model: {device_config['deviceModel']}\n")
        #     f.write(f"Manufacturer: {device_config['manufacturer']}\n")
        #     f.write(f"Software Version: {device_config['softwareVersion']}\n")
        #     f.write(f"Timestamp: {int(now.timestamp())}\n")
        #     f.write(commitmentData)

        # define the transaction function
        txn_func = contract.functions.storeCommitment(
            commitment_id,
            "zksensor.tech",
            device_config["deviceType"],
            device_config["deviceIdType"],
            device_config["deviceModel"],
            device_config["manufacturer"],
            device_config["softwareVersion"],
            commitmentData,
            int(now.timestamp())
        )
        # estimate gas
        estimated_gas = txn_func.estimate_gas({'from': Submitter_Wallet_Address})
        gas_price = w3.eth.gas_price

        # Prepare transaction
        # Fides Innova's native token is FDS, but gas price is still specified in gwei units for compatibility with Ethereum tooling.
        # The following line calls the storeCommitment function in the smart contract:
        # tx = contract.functions.storeCommitment(
        #     commitmentId = commitment_id,
        #     nodeId = "zksensor.tech",
        #     deviceType = device_config["deviceType"],
        #     deviceIdType = device_config["deviceIdType"],
        #     deviceModel = device_config["deviceModel"],
        #     manufacturer = device_config["manufacturer"],
        #     softwareVersion = device_config["softwareVersion"],
        #     commitment = commitmentData,
        #     timestamp = int(now.timestamp())
        # ).build_transaction({
        #     "from": Submitter_Wallet_Address,
        #     "nonce": w3.eth.get_transaction_count(Submitter_Wallet_Address),
        #     "gas": estimated_gas + 5000,
        #     "gasPrice": gas_price,
        #     "chainId": int(Blockchain_ID) if Blockchain_ID else 1
        # })

        tx = txn_func.build_transaction({
            'from': Submitter_Wallet_Address,
            'nonce': w3.eth.get_transaction_count(Submitter_Wallet_Address),
            'gas': estimated_gas + 5000,
            'gasPrice': gas_price,
            'chainId': Blockchain_ID
        })

        # Sign and send transaction
        signed_tx = w3.eth.account.sign_transaction(tx, private_key=Submitter_Wallet_Private_Key)
        tx_hash = w3.eth.send_raw_transaction(signed_tx.raw_transaction)

        # Wait for transaction to be mined
        tx_receipt = w3.eth.wait_for_transaction_receipt(tx_hash, timeout=120)

        # # Check the status field: 1 = success, 0 = failure
        # if tx_receipt["status"] != 1:
        #     raise RuntimeError(f"❌ Transaction failed. View on explorer: https://explorer.fidesinnova.io/{tx_hash.hex()}")

        # st.write(f"Transaction status: {tx_receipt['status']}")
        # Check the status field: 1 = success, 0 = failure

        if tx_receipt["status"] != 1:

            # If failed, try to get the revert reason
            try:
                # Rebuild the same call as a static call to get the revert reason
                revert_reason = w3.eth.call({
                    "to": Blockchain_Commitment_Smart_Contract_Address,
                    "from": Submitter_Wallet_Address,
                    "data": tx["data"]
                }, block_identifier=tx_receipt["blockNumber"])
            except Exception as e:
                # Now decode revert reason from the error
                try:
                    # Most revert messages follow this format
                    if hasattr(e, 'args') and len(e.args) > 0 and "revert" in e.args[0]:
                        reason = e.args[0].split("revert")[-1].strip()
                        st.error(f"❌ Transaction failed. Reason: {reason}\nExplorer: https://explorer.fidesinnova.io/{tx_hash.hex()}")
                        raise RuntimeError(f"❌ Transaction failed. Reason: {reason}\nExplorer: https://explorer.fidesinnova.io/{tx_hash.hex()}")
                    else:
                        st.error(f"❌ Transaction failed without explicit revert reason.\nExplorer: https://explorer.fidesinnova.io/{tx_hash.hex()}")
                        raise RuntimeError(f"❌ Transaction failed without explicit revert reason.\nExplorer: https://explorer.fidesinnova.io/{tx_hash.hex()}")
                except Exception:
                    st.error(f"❌ Transaction failed, and revert reason could not be parsed.\nExplorer: https://explorer.fidesinnova.io/{tx_hash.hex()}")
                    raise RuntimeError(f"❌ Transaction failed, and revert reason could not be parsed.\nExplorer: https://explorer.fidesinnova.io/{tx_hash.hex()}")

        # Transaction succeeded
        explorer_link = f"https://explorer.fidesinnova.io/tx/0x{tx_hash.hex()}"
        st.success(f"✅ Commitment uploaded successfully! View on explorer: {explorer_link}")

    # st.success(f"✅ Commitment uploaded successfully! View on explorer: {explorer_link}", f"✅ Transaction receipt: {tx_receipt}")
    return f"✅ Commitment uploaded! View on explorer: {explorer_link}", f"✅ Transaction receipt: {tx_receipt}"


commitmentSubmitterAgent = Agent(role="commitmentSubmitter",
                                 goal="Read the commitment file from the commitmentGenerator agent, and also, read the device_config.json, then call the commitmentSubmitter tool to upload the commitment json file on the Fides Innova blockchain network.",
                                 backstory="",
                                 tools=[commitmentSubmitterTool],
                                 llm=llm_model
                                 )

commitmentSubmitterTask = Task(agent=commitmentSubmitterAgent,
                               description="Read the commitment file from the commitmentGenerator agent, and also, read the device_config.json, then call the commitmentSubmitter tool to upload the commitment json file on the Fides Innova blockchain network.",
                               expected_output="A success message indicating the commitment file has been uploaded as well as a link to the transaction on the blockchain explorer." )

# Verifiable Computing Crew"""
# Agent, Description, Expected Output
agents = [deviceConfigAgent, CompilerAgent,  commitmentGeneratorAgent, commitmentSubmitterAgent]
tasks =  [deviceConfigTask, CompileTask, FindingOperatingSystemTask, ExecutingCommitmentGeneratorTask, commitmentSubmitterTask]
crew1 = Crew( agents = agents, tasks= tasks, verbose = True)

# Test"""

# def query():
#     question = input("What's your program name? (default: program.cpp)")
#     program_class = input("What's your program ZKP class? (default: 1)")
#     deviceType = input("What's your program device type? (default: Sensor)")
#     deviceIdType = input("What's your device ID type? (default: MAC)")
#     deviceModel = input("What's your device model? (default: Siemens IOT2050)")
#     manufacturer = input("What's your brand name? (default: Fides)")
#     softwareVersion = input("What's your program/firmware version? (default: 1.0)")
#     code_block = input("What's your program/firmware version? (default: [14, 15]])")

#     result = crew1.kickoff({"program":question,
#                             "class": program_class or "1",
#                             "deviceType": deviceType or "sensor",
#                             "deviceIdType": deviceIdType or "MAC",
#                             "deviceModel": deviceModel or "Siemens IOT2050",
#                             "manufacturer": manufacturer or "FDS",
#                             "softwareVersion": softwareVersion or "1.0",
#                             "code_block": code_block or "[14, 15]"
#                             })
#     return result
##############################################################
##############################################################

# Run action
if st.button("Submit to ZKP Agent"):
    if not program_name:
        st.error("Please upload a program file before submitting.")
    else:
        try:
            with st.status("Running ZKP Crew Tasks...", expanded=True) as status:
                st.write("▶️ Starting crew tasks...")

                result = crew1.kickoff({
                    "program": program_name,
                    "class": str(program_class),
                    "deviceType": device_type or "sensor",
                    "deviceIdType": device_id_type or "MAC",
                    "deviceModel": device_model or "Siemens IOT2050",
                    "manufacturer": manufacturer or "FDS",
                    "softwareVersion": software_version or "1.0",
                    "code_block": code_block or "[14, 15]"
                })

                st.write("✅ Crew tasks completed.")
                status.update(label="All tasks completed successfully!", state="complete")

                # Add download button
                config_path = st.session_state["config_path"]
                if os.path.exists(config_path):
                    with open(config_path, "rb") as f:
                        st.download_button(
                            label="📥 Download device_config.json",
                            data=f,
                            file_name="device_config.json",
                            mime="application/json"
                    )
                        
                    
                # Show download buttons
                for output_file in [st.session_state["new_filename"], st.session_state["asm_filename"]]:
                    path = Path(output_file)
                    if path.exists():
                        st.download_button(
                            label=f"📥 Download {path.name}",
                            data=open(path, "rb"),
                            file_name=path.name
                        )
                    else:
                        st.warning(f"⚠️ File not found: {path.name}")

        except Exception as e:
            st.error(f"❌ An error occurred: {e}")
