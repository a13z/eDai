pragma solidity 0.5.0;

import "zos-lib/contracts/Initializable.sol";
import "openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";
import "openzeppelin-solidity/contracts/ownership/Ownable.sol";

contract ERC20Edai is Initializable, ERC20, Ownable {
    address public vendingMachine;
    string public name;
    string public symbol;
    uint8 public decimals;

    function initialize() initializer public {
        name = "eDai";
        symbol = "EDAI";
        decimals = 18;
    }

    modifier onlyVendingMachine() {
        require(msg.sender == vendingMachine);
        _;
    }

    //Ideally the Vending Machine would actually create the ERC20Vendable,
    //and we could make mint and burn onlyCreator.
    //However, to get the ERC20 contract deployed before we have all of the VendingMachine stuff ready,
    //the ability to change is required to allow us to keep iterating on the VendingMachine design
    function changeVendingMachine(address newVendingMachine) onlyOwner public {
        vendingMachine = newVendingMachine;
    }

    /**
     * @dev Function to mint tokens
     * @param to The address that will receive the minted tokens.
     * @param amount The amount of tokens to mint.
     * @return A boolean that indicates if the operation was successful.
     */
    function mint(address to, uint256 amount) public onlyVendingMachine returns (bool) {
        _mint(to, amount);
        return true;
    }

    /**
     * @dev Burns a specific amount of tokens.
     * This is different then the standard Burnable definition.
     * We only want the vending machine to be able to burn the tokens, but we don't want to require
     * the two step approve and burnFrom which the standard case would require.
     * @param from The address of which tokens should be burned away from.
     * @param value The amount of token to be burned.
     */
    function burn(address from, uint256 value) public onlyVendingMachine returns (bool) {
        _burn(from, value);
        return true;
    }
}
