#
#  Panoramix v4 Oct 2019 
#  Decompiled source of bsc:0x4eB362934D56f2669a712Cb92d316cd465921B5D
# 
#  Let's make the world open source 
# 

def storage:
    stor3 is addr at storage 3
    stor5 is addr at storage 5
    stor9 is array of addr at storage 9
    stor10 is addr at storage 10
    stor11 is addr at storage 11
    stor12 is addr at storage 12
    stor15 is addr at storage 15
    stor16 is uint256 at storage 16
    stor17 is uint256 at storage 17
    stor18 is addr at storage 18

def _fallback() payable: # default function
    revert

def getToken(address _contract, uint256 _tokenId) payable: 
    require calldata.size - 4 >= 64
    mem[356 len 0] = None
    require ext_code.size(stor11)
    
    # write
    call stor11.0xb6f9de95 with:
        value call.value wei
        gas gas_remaining wei
        args _tokenId, Array(len=2, data=mem[356 len 64]), caller, block.timestamp + (240 * 24 * 3600)
        if not ext_call.success:
            revert with ext_call.return_data[0 len return_data.size]

def unknown6add6bd6(uint256 _param1, uint256 _param2): # not payable
    require calldata.size - 4 >= 64
    stor16 = _param1
    stor17 = _param2
    require 0 < stor9.length
    require ext_code.size(stor10)
    
    # read
    static call stor10.0xe6a43905 with:
            gas gas_remaining wei
            args stor3, stor9
        if not ext_call.success:
            revert with ext_call.return_data[0 len return_data.size]
        require return_data.size >= 32
        require ext_code.size(addr(ext_call.return_data))
    
    # read
    static call addr(ext_call.return_data).getReserves() with:
            gas gas_remaining wei
        if not ext_call.success:
            revert with ext_call.return_data[0 len return_data.size] 
        require return_data.size >= 96
        require ext_code.size(addr(ext_call.return_data))
    
    # read
    static call addr(ext_call.return_data).token1() with:
            gas gas_remaining wei
        if not ext_call.success:
            revert with ext_call.return_data[0 len return_data.size]
        require return_data.size >= 32
        require ext_code.size(addr(ext_call.return_data))
    
    if stor3 != ext_call.return_data[12 len 20]:
        
        # write
        call addr(ext_call.return_data).0x22c0d9f with:
            gas gas_remaining wei
            args Mask(112, 0, ext_call.return_dataaddr(this.address), 128, 96, stor3, Mask(112, 0, ext_call.return_data[0]) - 1, 1
    else:
        
        # write
        call addr(ext_call.return_data).0x22c0d9f with:
            gas gas_remaining wei
            args 0, Mask(112, 0, ext_call.return_dataaddr(this.address), 128, 96, stor3, Mask(112, 0, ext_call.return_data[32]) - 1, 1
    
    if not ext_call.success:
        revert with ext_call.return_data[0 len return_data.size]
        require ext_code.size(stor3)
    
    # read
    static call stor3.balanceOf(address owner) with:
            gas gas_remaining wei
            args this.address
        if not ext_call.success:
            revert with ext_call.return_data[0 len return_data.size]
        require return_data.size >= 32
        require ext_code.size(stor3)
    
    # write
    call stor3.transfer(address to, uint256 value) with:
        gas gas_remaining wei
        args stor18, ext_call.return_data[0]
        if not ext_call.success:
            revert with ext_call.return_data[0 len return_data.size]
        require return_data.size >= 32

def unknown84800812(): # not payable
    require calldata.size - 4 >= 128
    require cd <= 4294967296
    require cd <= calldata.size
    require ('cd', 100).length <= 4294967296 and cd('cd', 100).length + 36 <= calldata.size
    
    if addr(cd) != this.address:
        revert with 0, 'pancakeCall sender != this'
    
    require ('cd', 100).length >= 96
    
    if ('cd', 100) < stor9.length:
        require ext_code.size(stor10)
        
        # read
        static call stor10.0xe6a43905 with:
                gas gas_remaining wei
                args stor3, stor9[('cd', 100)]
            if not ext_call.success:
                revert with ext_call.return_data[0 len return_data.size]
        
        require return_data.size >= 32
        require ext_code.size(addr(ext_call.return_data))
        
        # read
        static call addr(ext_call.return_data).getReserves() with:
                gas gas_remaining wei
            if not ext_call.success:
                revert with ext_call.return_data[0 len return_data.size]
            require return_data.size >= 96
            require ext_code.size(addr(ext_call.return_data))

        # read
        static call addr(ext_call.return_data).token1() with:
                gas gas_remaining wei
            if not ext_call.success:
                revert with ext_call.return_data[0 len return_data.size]
            require return_data.size >= 32
            require ext_code.size(addr(ext_call.return_data))

        if stor3 != ext_call.return_data[12 len 20]:

            # write
            call addr(ext_call.return_data).0x22c0d9f with:
                gas gas_remaining wei
                args Mask(112, 0, ext_call.return_dataaddr(this.address), 128, 96, stor3, Mask(112, 0, ext_call.return_data('cd', 100) + 1

        else:

            # write
            call addr(ext_call.return_data).0x22c0d9f with:
                gas gas_remaining wei
                args 0, Mask(112, 0, ext_call.return_dataaddr(this.address), 128, 96, stor3, Mask(112, 0, ext_call.return_data('cd', 100) + 1

        if not ext_call.success:
            revert with ext_call.return_data[0 len return_data.size]
    else:

        require ext_code.size(stor3)
        
        # write
        call stor3.approve(address spender, uint256 value) with:
            gas gas_remaining wei
            args stor15, -1
            if not ext_call.success:
                revert with ext_call.return_data[0 len return_data.size]
            require return_data.size >= 32
            require ext_code.size(stor3)

        # write
        call stor3.approve(address spender, uint256 value) with:
            gas gas_remaining wei
            args stor12, -1
            if not ext_call.success:
                revert with ext_call.return_data[0 len return_data.size]
            require return_data.size >= 32
            require ext_code.size(stor5)

        # write
        call stor5.approve(address spender, uint256 value) with:
            gas gas_remaining wei
            args stor12, -1
            if not ext_call.success:
                revert with ext_call.return_data[0 len return_data.size]
            require return_data.size >= 32
            require ext_code.size(stor15)

        # read
        static call stor15.0x687d83dd with:
                gas gas_remaining wei
            if not ext_call.success:
                revert with ext_call.return_data[0 len return_data.size]
            require return_data.size >= 64

        if ext_call.return_data == 0x2ec2ddd12566b66f4da248b1ecdee8619b5c56cd:

            require ext_code.size(stor15)

            # write    
            call stor15.deposit(uint256 pubkey1, uint256 pubkey2) with:
                gas gas_remaining wei
                args 10000000 * 10^18, 0
                if not ext_call.success:
                    revert with ext_call.return_data[0 len return_data.size]
        
        idx = 0
        while idx < stor17:
            require ext_code.size(stor3)

            # read
            static call stor3.balanceOf(address owner) with:
                    gas gas_remaining wei
                    args addr(this.address)
                if not ext_call.success:
                    revert with ext_call.return_data[0 len return_data.size]
                require return_data.size >= 32
                require ext_code.size(stor15)

            # write
            call stor15.deposit(uint256 pubkey1, uint256 pubkey2) with:
                gas gas_remaining wei
                args ext_call.return_datastor16, 0
                if not ext_call.success:
                    revert with ext_call.return_data[0 len return_data.size]
                require ext_code.size(stor3)

            # read
            static call stor3.balanceOf(address owner) with:
                    gas gas_remaining wei
                    args addr(this.address)
                if not ext_call.success:
                    revert with ext_call.return_data[0 len return_data.size]
                require return_data.size >= 32
                require ext_code.size(stor12)

            # write
            call stor12.0x3df02124 with:
                gas gas_remaining wei
                args 0, 2, ext_call.return_data[0], 0
                if not ext_call.success:
                    revert with ext_call.return_data[0 len return_data.size]
                require ext_code.size(stor15)

            # read
            static call stor15.balanceOf(address owner) with:
                    gas gas_remaining wei
                    args addr(this.address)
                if not ext_call.success:
                    revert with ext_call.return_data[0 len return_data.size]
                require return_data.size >= 32
                require ext_code.size(stor15)

            # write
            call stor15.withdraw(uint256 devAmount, uint256 submissionAmount) with:
                gas gas_remaining wei
                args ext_call.return_data[0], 0
                if not ext_call.success:
                    revert with ext_call.return_data[0 len return_data.size]
                require ext_code.size(stor5)

            # read
            static call stor5.balanceOf(address owner) with:
                    gas gas_remaining wei
                    args addr(this.address)
                if not ext_call.success:
                    revert with ext_call.return_data[0 len return_data.size]
                require return_data.size >= 32

            mem[96] = 0x3df0212400000000000000000000000000000000000000000000000000000000
            mem[100] = 2
            mem[132] = 0
            mem[164] = ext_call.return_data[0]
            mem[196] = 0

            require ext_code.size(stor12)
            
            # write
            call stor12.0x3df02124 with:
                gas gas_remaining wei
                args 2, 0, ext_call.return_data[0], 0
                if not ext_call.success:
                    revert with ext_call.return_data[0 len return_data.size]

            idx = idx + 1
            continue

    require ext_code.size(addr(('cd', 100)))

    # write
    call addr(('cd', 100)).transfer(address to, uint256 value) with:
        gas gas_remaining wei
        args caller, ('cd', 100) + (3 * ('cd', 100) / 997) + 1
        if not ext_call.success:
            revert with ext_call.return_data[0 len return_data.size]
        require return_data.size >= 32
