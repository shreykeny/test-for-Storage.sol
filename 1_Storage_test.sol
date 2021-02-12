// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.4.22 <0.8.0;
import "remix_tests.sol"; // this import is automatically injected by Remix.
import "remix_accounts.sol";
import "../contracts/1_Storage.sol";

// File name has to end with '_test.sol', this file can contain more than one testSuite contracts

contract testStorage {
    Storage storeVar1;

    function BeforeEach() public {
        storeVar1 = new Storage();
    }

    // This should fail
    function firstTest() public returns (bool) {
        storeVar1.store(20);
        return
            Assert.equal(
                storeVar1.retrieve(),
                2020,
                "Retrieved number is not 2020"
            );
    }

    // This should pass
    function secondTest() public returns (bool) {
        storeVar1.store(2021);
        return
            Assert.equal(
                storeVar1.retrieve(),
                2021,
                "Retrieved number is not 2021"
            );
    }

    //This should pass as it is not equal
    function thirdTest() public returns (bool) {
        storeVar1.store(221);
        return
            Assert.notEqual(
                storeVar1.retrieve(),
                2021,
                "Retrieved number is not 2021"
            );
    }

    // This test should fail since we stored value as 221 in the  last function
    function fourthTest() public returns (bool) {
        return
            Assert.lesserThan(
                storeVar1.retrieve(),
                uint256(1),
                "Retrieved number is not 2021"
            );
    }
}
