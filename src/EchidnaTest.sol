// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {ERC20} from "lib/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";

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

    event ReturnedContracts(ERC20 firstContract, ERC20 secondContract);
    event DeploymentError(bytes error);

    function test_erc_deployed() public {
        Deployer deployer = new Deployer();
        try deployer.deployContractsAndSet() returns (ERC20 _a, ERC20 _b) {
            a = _a;
            b = _b;
            emit ReturnedContracts(_a, _b);
        } catch (bytes memory error) {
            emit DeploymentError(error);
        }
        // this assertion will fail
        assert(address(a) == address(0));
    }
}
