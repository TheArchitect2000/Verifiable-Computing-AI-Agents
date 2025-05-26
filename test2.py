
import streamlit as st
import os
import subprocess
from pathlib import Path

st.set_page_config(page_title="Fides Commitment Manager", layout="centered")
st.title("🔒 Fides Innova Commitment Manager")

st.markdown("""
This app helps you:
- Upload a Python or C++ file
- Inject FidesZKP library
- Compile for your target processor
- Generate Zero-Knowledge Commitment
- Upload commitment to blockchain
""")

# Step 1: Upload Code File
uploaded_file = st.file_uploader("Upload your source code (.py or .cpp)", type=["py", "cpp"])

# Step 2: Select Target Processor
processor = st.selectbox("Choose your target processor", ["RISC-V", "ARM"], index=0)

if uploaded_file and processor:
    filename = uploaded_file.name
    code_path = Path("temp") / filename
    os.makedirs(code_path.parent, exist_ok=True)
    with open(code_path, "wb") as f:
        f.write(uploaded_file.read())

    st.success(f"Uploaded {filename} successfully!")

    # Step 3: Inject FidesZKP Library
    if filename.endswith(".py"):
        injected_path = code_path.with_name(code_path.stem + "_AddedFidesZKPLib.py")
        with open(code_path, "r") as infile, open(injected_path, "w") as outfile:
            outfile.write("import fideszkp\n")
            outfile.write(infile.read())
    elif filename.endswith(".cpp"):
        injected_path = code_path.with_name(code_path.stem + "_AddedFidesZKPLib.cpp")
        with open(code_path, "r") as infile, open(injected_path, "w") as outfile:
            outfile.write("#include \"FidesZKP.h\"\n")
            outfile.write(infile.read())

    st.info("✅ FidesZKP library injected successfully.")

    # Step 4: Compile code (simulated)
    asm_output = injected_path.with_suffix(".s")
    try:
        result = subprocess.run([
            "g++", str(injected_path), "-o", asm_output
        ], check=True, capture_output=True, text=True)
        st.success("🔧 Compilation successful!")
    except subprocess.CalledProcessError as e:
        st.error("❌ Compilation failed")
        st.text(e.stderr)

    # Step 5: Simulate ZKP Generator
    zkp_output = injected_path.with_stem(injected_path.stem + "_ZKPGen.s")
    param_json = injected_path.with_stem(injected_path.stem + "_Param.json")
    commitment_json = injected_path.with_stem(injected_path.stem + "_Commitment.json")
    Path(zkp_output).write_text("// ZKP Assembly Placeholder")
    Path(param_json).write_text("{" + f'\"processor\":\"{processor}\"' + "}")
    Path(commitment_json).write_text("{" + f'\"file\":\"{filename}\"' + "}")
    st.success("🧪 ZKP Commitment generated.")

    # Step 6: Simulate Blockchain Upload
    tx_hash = "0xabc123456789def"
    explorer_url = f"https://explorer.fidesinnova.io/{tx_hash}"
    st.success("📤 Commitment uploaded to Fides Blockchain")
    st.markdown(f"Explorer URL: [View on Explorer]({explorer_url})")

    # Step 7: Downloadable Results
    with open(zkp_output, "rb") as f:
        st.download_button("Download ZKP Assembly", f, file_name=zkp_output.name)
    with open(param_json, "rb") as f:
        st.download_button("Download Parameters JSON", f, file_name=param_json.name)
    with open(commitment_json, "rb") as f:
        st.download_button("Download Commitment JSON", f, file_name=commitment_json.name)
else:
    st.warning("Please upload a source code file and choose a processor to continue.")
