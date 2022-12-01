// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Deployer {
    function deployContractsAndSet() public returns (ERC20, ERC20) {
        ERC20 contract1 = new ERC20("a", "b");
        ERC20 contract2 = new ERC20("a2", "b2");

        return (contract1, contract2);
    }
}

contract EchidnaTest {
    ERC20 a;
    ERC20 b;

    constructor() {
        Deployer deployer = new Deployer();
        (a, b) = deployer.deployContractsAndSet();
    }

    function echidna_da() public view returns (bool) {
        return true;
    }
}
