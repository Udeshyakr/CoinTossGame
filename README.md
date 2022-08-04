# Coin Toss Game

Coin Toss game is basically a betting game

```
So, generating a random number in smart contracts is widely known as a difficult problem.
On the blockchain, there is nearly no source of randomness.
Everything the contract sees, the public sees. Because of that, someone could game the system by just looking at the smart contract,

```

```
Here, I take two numbers given to me by Solidity,
block.difficulty and block.timestamp and combine them to create a random number.
block.difficulty tells miners how hard the block will be to mine based on the transactions in the block.
Blocks get harder for a # of reasons, but, mainly they get harder when there are more transactions in the block (some miners prefer easier blocks, but, these payout less).
block.timestamp is just the Unix timestamp that the block is being processed.
But, technically, both block.difficulty and block.timestamp could be controlled by a sophisticated attacker.
```

```
To make this harder, I create a variable seed that will essentially change every time a user sends a new wave. So, I combine all three of these variables to generate a new random seed.
Then I just do % 1000.which will make sure the number is brought down to a range between 0 - 999.
```
