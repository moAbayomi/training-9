# Training 9 
## Thrift Contract

This is a Solidity smart contract that implements a basic thrift system. Users can fund the contract, check their thrifted balance, and withdraw funds.

## Features

1. **Fund the Contract:**
   - Users can deposit Ether into the contract using the `fund` function.
   - Ether amount must be greater than zero.

2. **Check Balance:**
   - Users can check their thrifted balance using the `checkMyBal` function.

3. **Withdraw Funds:**
   - Users can withdraw funds from their thrift balance using the `withdraw` function.
   - Withdrawal amount must be greater than zero and not exceed the user's thrifted balance.

4. **Events:**
   - The contract emits events (`Funded` and `Withdrawn`) to log fund deposits and withdrawals.
   - Events include the amount involved and the relevant address.

## Usage

1. Deploy the Contract:
   - Deploy this contract to your Ethereum network of choice.

2. Fund the Contract:
   - Call the `fund` function with an amount greater than zero to deposit funds.

3. Check Balance:
   - Use the `checkMyBal` function to view your thrifted balance.

4. Withdraw Funds:
   - Withdraw funds using the `withdraw` function, specifying the desired withdrawal amount.


