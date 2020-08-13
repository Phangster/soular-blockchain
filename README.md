## Compiling blockchain code
Compiling the contract run `truffle-compile`
` cd build/contract` and extract the abi and contract address from Energy.json

## Sign up an account with Infura
Sign up an account with Infura (https://infura.io/) and create a project 
In Infura, go to settings and extract the ‘PROJECT ID’ and select an ‘ENDPOINT’ and select an ethereum net that the project is using (in this project, it is using Kovan Test Net)
Update the ‘PROJECT ID’ and contract address https://github.com/busukxuan/soular-microservices/blob/master/common/blockchain.ts
Login to either Ganache or a current crypto wallet and input the ’WALLETADDRESS’

## Deploying in any testnet you like
`npm run start:<kovan>`

## After deployment
After a successful buy/sell is triggered, go to `https://kovan.etherscan.io/` and enter the contract address in the search. A transaction will be updated to the contract address within 15 seconds of triggering from the application


## Credits
https://blog.ippon.tech/creating-your-first-truffle-project-part-2-of-2/
https://medium.com/coinmonks/step-by-step-approach-to-create-dapp-using-ethereum-reactjs-ipfs-part-3-final-851187ca9c24
https://www.freecodecamp.org/news/hands-on-get-started-with-infura-and-ipfs-on-ethereum-b63635142af0/

