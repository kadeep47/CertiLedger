# CertiLedger

# Smart Contracts

## Introduction

This project includes various smart contract variations designed to manage and interact with digital certificates on the Ethereum blockchain. Each contract serves a specific purpose, ranging from simple storage to more advanced features like IPFS integration, PDF storage, access control, and multi-signature approval.

## Smart Contract Variations

### 1. Simple Storage

- **Description:** Basic smart contract to store and retrieve certificates in a standard format.
- **Link:** [Simple Storage Contract](https://goerli.etherscan.io/address/0xa3812d892193dd251c78f4ab017df7a2f5cfd1f9)

### 2. IPFS Integration (v2_ifps)

- **Description:** Smart contract integrating IPFS for enhanced certificate management.
- **Link:** [IPFS Integration Contract](https://goerli.etherscan.io/address/0x9b1ece76339ed92b255cf83cb277e2ab8567bdf2)

### 3. Access Control (v3_lock)

- **Description:** Smart contract implementing partial and full access to digital certificates.
- **Link:** [Access Control Contract](https://goerli.etherscan.io/address/0xecf43337515ef91bfd8739ea474b8a66146c12f0)

### 4. PDF Direct Storage (v4_pdf)

- **Description:** Smart contract directly storing complete PDFs on the blockchain.
- **Link:** [PDF Direct Storage Contract](https://goerli.etherscan.io/address/0x9b1ece76339ed92b255cf83cb277e2ab8567bdf2#writeContract)
  

### 5. Role-Based Access (v5_rba)

- **Description:** Smart contract with roles (admin, owner, verifier) for different access and control over generated PDFs.
- **Link:** [Role-Based Access Contract](https://goerli.etherscan.io/address/0x3c90aed5a35628675067962e67de5ff1b1ed050e#code)

### 6. Multi-Signature Approval (multisign)

- **Description:** Smart contract requiring mutual agreement of both involved parties for certificate generation.
- **Link:** [Multi-Signature Approval Contract](<Contract Link>)

## Usage

Each smart contract comes with its own set of functionalities. Refer to the specific contract documentation for details on how to interact with and utilize its features.

## Testing and Deployment

To test and deploy the smart contracts, follow these steps:

1. Clone the repository: `git clone https://github.com/kadeep47/CertiLedger.git`
2. Navigate to the `contracts` directory.
3. Compile the contracts using a Solidity compiler.
4. Deploy the compiled contracts to the Ethereum network of your choice.


## Contributing

Feel free to reach out in case of any questions, doubts, or suggestions for improvements. If you have ideas to enhance the smart contracts, please don't hesitate to raise an issue.


