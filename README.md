# CertiLedger

# Smart Contract Variations

This project includes multiple variations of smart contracts, each serving a specific purpose in enhancing the functionality of the blockchain-based file storage and sharing system.

## Simple Storage (v1)

The `SimpleStorage` smart contract provides basic functionality for storing and retrieving data in a standard format. It encapsulates a straightforward struct storage mechanism.

## Multisign (v2)

The `Multisign` smart contract implements a more complex logic involving the mutual agreement of both involved parties. It serves the purpose of approving certificates generated after mutual consent.

## IPFS Integration (v2_ipfs)

The `IPFS Integration` smart contract focuses on integrating the InterPlanetary File System (IPFS) into the blockchain. This variation enhances file storage capabilities by leveraging the decentralized and distributed nature of IPFS.

## Direct PDF Storage (v4_pdf)

The `Direct PDF Storage` smart contract is designed specifically for storing complete PDF documents directly on the blockchain. This variation ensures a secure and immutable storage solution for important documents.

## Access Control (v3_lock)

The `Access Control` smart contract implements a role-based access control system. It provides partial and full access to digital certificates based on predefined roles. This enhances security and privacy in file sharing.

## Role-Based Access (v5_rba)

The `Role-Based Access` smart contract extends access control by introducing roles such as admin, owner, and verifier. Each role has different levels of access and control over the generated PDF documents, adding granularity to the access management system.

## Testing and Deployment

To test and deploy these smart contracts, follow these steps:

1. Ensure you have a compatible Ethereum development environment set up.
2. Navigate to the `contracts/` directory.
3. Choose the desired smart contract variation.
4. Compile the smart contract using [compiler-name].
5. Deploy the compiled contract to the Ethereum blockchain.

Refer to the specific documentation in each smart contract directory for detailed instructions on testing and deployment.

## Contributing

If you would like to contribute or suggest improvements to the smart contracts, please follow the contribution guidelines outlined in the main README.

