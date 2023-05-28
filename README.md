<h1 align="center">
  <br>  
  TuniSupply
  <br>
</h1>

<p align="center">
  
  <a href="https://github.com/trufflesuite/ganache-cli">
    <img src="https://github.com/SamiKammoun/TuniSupply-P2M/blob/main/images/ganachetrans.png" width="90">
  </a>
  <a href="https://soliditylang.org/">
    <img src="https://github.com/SamiKammoun/TuniSupply-P2M/blob/main/images/Solidity.svg" width="80">       
  </a>
  <a href="https://reactjs.org/"><img src="https://github.com/SamiKammoun/TuniSupply-P2M/blob/main/images/react.png" width="80"></a>
  
  <a href="https://www.trufflesuite.com/">
    <img src="https://github.com/SamiKammoun/TuniSupply-P2M/blob/main/images/trufflenew.png" width="50">
  </a>
   &nbsp;&nbsp;&nbsp;
  <a href="https://www.npmjs.com/package/web3">
    <img src="https://github.com/SamiKammoun/TuniSupply-P2M/blob/main/images/web3.jpg" width="60">
  </a>
  
  <a href="https://material-ui.com/">
    <img src="https://github.com/SamiKammoun/TuniSupply-P2M/blob/main/images/mat.png" width="60">       
  </a>
  &nbsp;&nbsp;&nbsp;
  <a href="https://expressjs.com/"><img src="https://github.com/SamiKammoun/TuniSupply-P2M/blob/main/images/express.svg" width="50"></a>
  &nbsp;&nbsp;
  <a href="https://www.nginx.com/">
    <img src="https://github.com/SamiKammoun/TuniSupply-P2M/blob/main/images/nginx.png" width="80">
  </a>
</p>

<h4 align="center">A simple Supply Chain setup with <a href="https://docs.soliditylang.org/en/v0.8.4/" target="_blank">Solidity</a>.</h4>

<p align="center">
  <a >
    <img src="https://img.shields.io/badge/dependencies-up%20to%20date-brightgreen.svg">
       
  </a>
  <a href="https://github.com/SamiKammoun/TuniSupply-P2M/issues"><img src="https://img.shields.io/github/issues/rishav4101/eth-supplychain-dapp.svg"></a>
  
  <a href="https://opensource.org/licenses/MIT">
    <img src="https://img.shields.io/badge/license-MIT-green.svg">
  </a>
</p>

<p align="center">
  <a href="#description">Description</a> •
  <a href="#architecture">Architecture</a> •
  <a href="#flow">Flow</a> •
  <a href="#working">Working</a> •
  <a href="#contract-diagrams">Contract Diagrams</a> •
  <a href="#installation-and-setup">Installation and Setup</a> •
  <a href="#license">License</a>
</p>

## Description

Supply chain is always hard to manage and requires a lot of admistrative machinery. However, when managed with smart contracts using blockchain, a lot of the paperwork is reduced.
Also it leads to an increase in transparency and helps to build an efficient Root of Trust. Spply-chain-dapp is such an implementation of a supply chian management system wich uses blockchain to ensure a transparent and secure transfer of product from the manufacturer to the customer via the online e-commerce websites.

## Architecture

The smart contract is being written with Solidity which is then compiled, migrated and deployed using Truffle.js on the local blockchain network created using Ganache-cli.The frontend uses Web3.js to communicate with the smart contract and local blockchain network and is written using React.js framework for better component and state lifecycle management.The requests from user are forwarded to frontend through Nginx(load balancer) and Express.js for dynamic routing.

<p align="centre">  
    <img src="https://github.com/SamiKammoun/TuniSupply-P2M/blob/main/images/architecturefinal.png?raw=true" >  
</p>

## Flow

<p align="centre">  
    <img src="https://github.com/SamiKammoun/TuniSupply-P2M/blob/main/images/flow.png" width="300">  
</p>

## Working (English)

<p>
  The lifecycle of a product starts when <strong>manufactureProduct()</strong> is called(while making an entry) after the final product is manufactured and the product and manufacturer details are entered in the blockchain. The <strong>productHistory[]</strong> gets initialized and the current product data is stored with the current owner(manufacturer).
</p>
<p>
  Now this product shall be available to the Third Party for purchase. On being purchased by a third party seller, the <strong>purchasedByThirdParty()</strong> gets called where the owner is set to thirdParty and the present data gets pushed to the <strong>productHistory[]</strong> (which helps us to track the origin and handling of the product). Simultaneously, the product is shipped by the manufacturer (<strong>shipToThirdParty()</strong>) and is received by the Third Party where <strong>receivedByThirdParty()</strong> is called and the details of the Third Party seller are entered. Each of these checkpoint's data is stored in product history with the state being updated at each step. 
</p>
<p>
  The online purchase of the product takes place from the Third Party. When the customer orders the product, it is shipped by the Third Party (<strong>shipByThirdParty()</strong>) and received by the delivery hub where the <strong>receivedByDeliveryHub()</strong> is called. Here the customer address is stored, owner is set to Delivery Hub, details of the Delivery Hub are fed and the current data state gets pushed to the <strong>productHistory[].</strong>
</p>
<p>
  Finally the product is shipped by the Delivery Hub (<strong>shipByDeliveryHub()</strong>) and received by the customer where the <strong>receivedByCustomer()</strong> is called and the current and final state gets pushed to the <strong>productHistory[]</strong>.
</p>
<p>
  All of these juncture functions shall be called only after complete verification of product and <strong>productHistory[]</strong> while entering a checkpoint. (eg:- Customer accepts and confirms the product by clicking the receive button from his account only after it verifies the product). 
</p>
<p>
  <strong>fetchProductPart1()</strong>, <strong>fetchProductPart2()</strong>, <strong>fetchProductPart3()</strong>, <strong>fetchProductHistoryLength()</strong>, <strong>fetchProductCount()</strong>, <strong>fetchProductState()</strong> are the functions to retreive data of a product queried with UID and data type as product(current state) or history.
</p>
<p>
  The hashes(read certificates) are generated using the Solidity cryptographic function <strong>keccak256()</strong> which implements a SHA-3 hash in the blockchain setup. <strong>keccak256()</strong> generates a secure 256-bit hash which is the main basis of security in the entire mainnet apart from the smart contracts being immutable. In our supply chain setup certificates are generated at every stage of shipping of the product. 
</p>

## Working (French)

<p>
  Le cycle de vie d'un produit commence lorsque <strong>manufactureProduct()</strong> est appelé (lors de la création d'une entrée) après que le produit final soit fabriqué et que les détails du produit et du fabricant soient entrés dans la blockchain. Le <strong>productHistory[]</strong> est initialisé et les données du produit actuel sont stockées avec le propriétaire actuel (le fabricant).
</p>
<p>
  Maintenant, ce produit sera disponible pour le tiers pour l'achat. Lorsqu'il est acheté par un vendeur tiers, le <strong>purchasedByThirdParty()</strong> est appelé où le propriétaire est défini sur thirdParty et les données actuelles sont poussées vers le <strong>productHistory[]</strong> (ce qui nous aide à suivre l'origine et la manipulation du produit). Simultanément, le produit est expédié par le fabricant (<strong>shipToThirdParty()</strong>) et est reçu par le tiers où <strong>receivedByThirdParty()</strong> est appelé et les détails du vendeur tiers sont entrés. Les données de chaque point de contrôle sont stockées dans l'historique du produit avec l'état mis à jour à chaque étape.
</p>
<p>
  L'achat en ligne du produit a lieu auprès du tiers. Lorsque le client commande le produit, il est expédié par le tiers (<strong>shipByThirdParty()</strong>) et reçu par le hub de livraison où le <strong>receivedByDeliveryHub()</strong> est appelé. Ici, l'adresse du client est stockée, le propriétaire est défini sur Delivery Hub, les détails du Delivery Hub sont alimentés et l'état actuel des données est poussé vers le <strong>productHistory[].</strong>
</p>
<p>
  Enfin, le produit est expédié par le Delivery Hub (<strong>shipByDeliveryHub()</strong>) et reçu par le client où le <strong>receivedByCustomer()</strong> est appelé et l'état actuel et final est poussé vers le <strong>productHistory[]</strong>.
</p>
<p>
  Toutes ces fonctions de jonction ne doivent être appelées qu'après une vérification complète du produit et du <strong>productHistory[]</strong> lors de l'entrée d'un point de contrôle. (par exemple: - Le client accepte et confirme le produit en cliquant sur le bouton de réception depuis son compte uniquement après avoir vérifié le produit).
</p>
<p>
  <strong>fetchProductPart1()</strong>, <strong>fetchProductPart2()</strong>, <strong>fetchProductPart3()</strong>, <strong>fetchProductHistoryLength()</strong>, <strong>fetchProductCount()</strong>, <strong>fetchProductState()</strong> sont les fonctions pour récupérer les données d'un produit interrogé avec UID et le type de données comme produit (état actuel) ou historique.
</p>
<p>
  Les hachages (certificats de lecture) sont générés à l'aide de la fonction cryptographique Solidity <strong>keccak256()</strong> qui implémente un hachage SHA-3 dans la configuration blockchain. <strong>keccak256()</strong> génère un hachage sécurisé de 256 bits qui est la base principale de la sécurité dans l'ensemble du mainnet en dehors des contrats intelligents étant immuables. Dans notre configuration de chaîne d'approvisionnement, des certificats sont générés à chaque étape d'expédition du produit.
</p>

## Contract Diagrams

### Activity Diagram

The overall flow of the project is described as follows.

<p align="centre">
  <a>
    <img src="https://github.com/SamiKammoun/TuniSupply-P2M/blob/main/images/activitydiagram.png?raw=true" >
  </a>
</p>
<h3> Sequence Diagram</h3>
The flow of the functions in the smart contracts.
<p align="centre">
  <a>
    <img src="https://github.com/SamiKammoun/TuniSupply-P2M/blob/main/images/sequencediagram.png?raw=true" width="1000">
  </a>
</p>
<h3> Data Flow Diagram </h3>
The entire structure of the code.
<p align="centre">
  <a>
    <img src="https://github.com/SamiKammoun/TuniSupply-P2M/blob/main/images/dataflow.png?raw=true">
  </a>
</p>

## Installation and Setup

### Method 1

Prerequisites : `npm, git, docker(optional)`

Clone the repository

```Bash
git clone https://github.com/SamiKammoun/TuniSupply-P2M.git && cd TuniSupply-P2M
```

Install dependencies

```Bash
npm i
```

Install ganache-cli

```Bash
npm i -g ganache-cli
```

Configure ganache-cli for 10 accounts and extend gasLimit to 6721975000 and beyond, so as to have enough gas for migrating the smart contracts and a data flow for the prototype.

```Bash
ganache-cli --accounts 10 --gasLimit 6721975000
```

If you want to run the ganache-cli on docker then use the following command

```Bash
sudo docker run -d -p 8545:8545 trufflesuite/ganache-cli:latest -h 0.0.0.0 --accounts 10 --gasLimit 6721975000
```

Open a second terminal and enter the client folder

```Bash
cd client
```

Install all packages in the package.json file

```Bash
npm i
```

Setup an .env file using the `nano .env` command and enter the google maps api key and set the react rpc port to 8545 since the ganache-cli runs on the same port by default.
The final .env file must look like this

```Bash
REACT_APP_RPC=http://127.0.0.1:8545/
```

Run the app

```Bash
npm start
```

The app gets hosted by default at port 3000.

### Method 2

chmod +x ./start-project.sh

./start-project.sh

### Using the app:

<!-- install metamask instructions and add the following network:
Localhost 8545
http://localhost:8545
1337
ETH -->

-   Install Metamask extension on your browser.
-   Create an account and save the seed phrase.
-   Connect to the local network.
    -   Click on the network dropdown.
    -   Click on custom RPC.
    -   Enter the following details:
        -   Network Name: Localhost 8545
        -   New RPC URL: http://localhost:8545
        -   Chain ID: 1337
        -   Currency Symbol: ETH
    -   Click on save.
-   Import the account using the private keys from ganache cli (in method 1, you will find it in the bash output. In method 2, you will find a file called ganache.txt)
    -   The ganache output should be like that: ```Bash Ganache CLI v6.12.2 (ganache-core: 2.13.2)

# Available Accounts

(0) 0xe1a229D77828559BC0ea9e09DA0E340eA625BFC2 (100 ETH)
(1) 0xF895a4c5A537c4bb0065beA4441ED9Cc6B1488C4 (100 ETH)
(2) 0xb3d0Fa917d8F0C8f3aFEe40F59c1042430f7EBb4 (100 ETH)
(3) 0x98F5644b9367B9D9a05EB99A037B370dD9Aac7Bf (100 ETH)
(4) 0x0600B9eBb00045e33b5A5cF2b1c8FEbe4cf228eB (100 ETH)
(5) 0xB99527092Cd884d27A4ad6f9bA18fd932861C67e (100 ETH)
(6) 0x614472A2bABe47f2061F08cF09DE1dE6062dD2F6 (100 ETH)
(7) 0x65f90517dcB558eECA9dd5F3d3908102BfDF3a5f (100 ETH)
(8) 0x2EEBdF38943ce6590b89b69B864D1E1156004231 (100 ETH)
(9) 0xD5E33D2dc64aFb3df7eFBca5bc5087817d25dE43 (100 ETH)

# Private Keys

(0) 0x263aabdab7f4a5612a6f5482551a5fba2af7a4470dc3907fecaeab1bb2006c6a
(1) 0xd65e6e5b0fd54410d941342345b674ceddc1b52819f5b0e923a32db648cd00e6
(2) 0x40e108f4a741f656b0d2dbc244b9e1148f76093d7c2cc5ab1da68e2822718c26
(3) 0x2f2073059eea471959c57b00d2ad434c8e9440751f684b30527b662b94a9d48b
(4) 0x5e94c8f5da99df6bfb135bf3b45c52300da0faff1f43faba382310ac27d6051c
(5) 0x8014c3195bab9bd496547dde4c12b80451c629dbfc997d93b0c1c5dceb19d83d
(6) 0x0365d829ea1efab3b7744247d97748d95f532eb5bc036134f9c173fdeaaa9a92
(7) 0x622bd4965c8127e0751fec8214f3250047d8c6000816532347b0d2733123e170
(8) 0xfe01febcb13e9c5e8fd08b3876f1553d06dfae79b2c02e50dd6d025288244134
(9) 0xc777c501954e6a733f705963aa80e955e6a8d3fe385720a77b59ca50a329a321

# HD Wallet

Mnemonic: punch someone rain liberty slice brown grace swap ethics syrup tooth alter
Base HD Path: m/44'/60'/0'/0/{account_index}```

-   Copy the first private key and paste it in the private key field in metamask.
-   Click on import.
-   You are now connected to the local network and have an account to interact with the smart contract.
-   Open the app in the browser and you can now interact with the smart contract.

## License

This project uses an [MIT](https://opensource.org/licenses/MIT) license.

It is part of our P2M project at Sup'Com.

## Documentation to help with Solidity

https://docs.soliditylang.org/en/v0.8.4/

## Documentation to help with React

https://reactjs.org/docs/getting-started.html

## Documentation to help with Truffle

https://www.trufflesuite.com/docs/truffle/reference/configuration

## Documentation to help with Ganache-cli

https://www.trufflesuite.com/docs/ganache/overview
