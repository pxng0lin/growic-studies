// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

/// @title Growic task answers
/// @author pxng0lin
/// @notice Examples of primitive data types used to answer questions from task 1 in the Growic 2022 course

contract Primitives {
    /** To initiate the contract with, for example, vairables with values, you can
     * use the contstructor to pass them through or provide the values as arguments
     */

    uint256 public storedData; // example 1
    uint256 public passedData; // example 2
    string public tokenName;
    
    constructor(string memory _name, uint256 _number) payable {
        storedData = 10;
        passedData = _number;
        tokenName = _name;
        
    }

    /** PRIMITIVE DATA TYPES TASK */

    // BOOLEAN
    bool public defaultB; // defaults as false, result is either true or false
    bool iAmFalse = false; // default value
    bool public iAmTrue = true; // set to true

    // uint wizard: https://doc.embedded-wizard.de/uint-type?v=8.10
    // uint 128 example: https://www.b6sw.com/ViviFire/docs/UInt128_Data_Type.html
    // uint 256 example: https://ethereum.stackexchange.com/questions/29946/what-is-uint256

    // INTEGERS
    // these are unsigned integers and cannot be a negative number, they range from 8 to 256 bits, and move in steps of 8
    // (2 ** 8) - 1 = 256 - 1 = 255
    uint256 public defaultU; // defaults value is 0
    uint8 public _uint8 = 255; // max value of 255
    uint16 public _uint16 = 65535; // max value of 65535
    uint32 public _uint32 = 4294967295; // max value 4294967295, could also be defined as 0.000000004294967295 ether
    uint64 public _uint64 = 2**64 - 1; // could also be defined as 18.446744073709551516 ether
    uint128 public _uint128 = 2**128 - 1; // 340282366920938463463374607431768211356 ether
    uint256 public _uint256 = 2**256 - 1; // 115792089237316195423570985008687907853269984665640564039457584007913129639935 ether

    // these are signed integers and can be both positive or negative
    // int256 ranges from -2 ** 255 to 2 ** 255 - 1
    // int128 ranges from -2 ** 127 to 2 ** 127 - 1
    int public defaultI; // defaults value is 0
    int8 public i8 = -1;
    int public i256 = 456;
    int public i = -123; // int is same as int256
    int public minInt = type(int).min; // -57896044618658097711785492504343953926634992332820282019728792003956564819968 ether
    int public maxInt = type(int).max; // 57896044618658097711785492504343953926634992332820282019728792003956564819967 ether

    // ADDRESSES
    // an address used to transact on the blockchain, can be considered an identity or account number, they hold a 20 byte value (size of eth address).
    // payable addresses have transfer and send members, address payable can receive Ether, a simple address cannot.
    address public defaultA; // 0x0000000000000000000000000000000000000000
    address public addr1 = 0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c;
    address payable public addr2 =
        payable(0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c); // this is new since 0.8.0 as per the documentation

    // BYTES
    // src: https://medium.com/coinmonks/understanding-value-types-in-solidity-5caa1af846ef
    // src: https://docs.soliditylang.org/en/v0.5.10/types.html#bytes-and-strings-as-arrays

    /** The value types bytes1, bytes2, bytes3, …, bytes32 contain a sequence of bytes (from 1 to 32).
     * In Solidity, the data type byte represent a sequence of bytes.
     * there are two byte types, fixed-sized byte arrays and dynamically-sized byte arrays.
     * bytes are not values types
     */

    bytes1 public testBytes = "a";
    bytes2 public testBytes1 = "bc";
    bytes32 public testBytes32 = "GROWICTASK1";

    /** FURTHER READING: https://www.tutorialspoint.com/solidity/solidity_enums.htm
     * Enums restrict a variable to have one of only a few predefined values.
     * The values in this enumerated list are called enums.
     * For example, if we consider an application for a fresh juice shop, it would be possible to restrict the glass size to small, medium, and large.
     * This would make sure that it would not allow anyone to order any size other than small, medium, or large.
     * Values are represented by unsigned integers starting from 0
     */

    // ENUMS
    // Enum list, which will output as 0, 1, 2
    enum Size {
        small,
        medium,
        large
    }

    // function to return the smallest size from the enum
    function getSmallestSize() public pure returns (Size) {
        return Size.small;
    }

    // function to return the medium size from the enum
    function getMediumSize() public pure returns (Size) {
        return Size.medium;
    }

    // function to return the largest size from the enum
    function getLargestSize() public pure returns (Size) {
        return Size.large;
    }
}
