(module
 (type $0 (func (param i32) (result i32)))
 (type $1 (func (param i32 i32) (result i32)))
 (type $2 (func (param i32 i32)))
 (type $3 (func (param i32 i32 i32)))
 (type $4 (func (param i32)))
 (type $5 (func (param i32 i32 i32) (result i32)))
 (type $6 (func (param i32 i32 i32 i32)))
 (type $7 (func (result i32)))
 (type $8 (func (param i32 i32 i32 i32) (result i32)))
 (type $9 (func (param i32 i64) (result i32)))
 (type $10 (func))
 (type $11 (func (param i32 i64)))
 (type $12 (func (param i32 i32 i32 i32 i32)))
 (type $13 (func (param i32 i32 i32 i32 i64 i32)))
 (type $14 (func (param i64 i64) (result i32)))
 (type $15 (func (param i64 i64 i64 i64) (result i32)))
 (type $16 (func (param i64 i64)))
 (type $17 (func (param i32 i32 i64)))
 (type $18 (func (param i32 i32) (result i64)))
 (type $19 (func (param i64 i64 i64 i64 i64 i64 i64 i64) (result i32)))
 (type $20 (func (param i64) (result i64)))
 (type $21 (func (param i32) (result i64)))
 (type $22 (func (param i64 i64) (result i64)))
 (import "env" "exit" (func $~lib/@btc-vision/btc-runtime/runtime/env/global/env_exit (param i32 i32 i32)))
 (import "env" "environment" (func $~lib/@btc-vision/btc-runtime/runtime/env/global/getEnvironmentVariables (param i32 i32 i32)))
 (import "env" "calldata" (func $~lib/@btc-vision/btc-runtime/runtime/env/global/getCalldata (param i32 i32 i32)))
 (import "env" "sha256" (func $~lib/@btc-vision/btc-runtime/runtime/env/global/_sha256 (param i32 i32 i32)))
 (import "env" "load" (func $~lib/@btc-vision/btc-runtime/runtime/env/global/loadPointer (param i32 i32)))
 (import "env" "store" (func $~lib/@btc-vision/btc-runtime/runtime/env/global/storePointer (param i32 i32)))
 (import "env" "outputsSize" (func $~lib/@btc-vision/btc-runtime/runtime/env/global/getOutputsSize (result i32)))
 (import "env" "outputs" (func $~lib/@btc-vision/btc-runtime/runtime/env/global/outputs (param i32)))
 (import "env" "emit" (func $~lib/@btc-vision/btc-runtime/runtime/env/global/emit (param i32 i32)))
 (import "env" "accountType" (func $~lib/@btc-vision/btc-runtime/runtime/env/global/getAccountType (param i32) (result i32)))
 (import "env" "call" (func $~lib/@btc-vision/btc-runtime/runtime/env/global/callContract (param i32 i32 i32 i32) (result i32)))
 (import "env" "callResult" (func $~lib/@btc-vision/btc-runtime/runtime/env/global/getCallResult (param i32 i32 i32)))
 (import "env" "verifySignature" (func $~lib/@btc-vision/btc-runtime/runtime/env/global/verifySignature (param i32 i32 i32) (result i32)))
 (import "env" "loadMLDSA" (func $~lib/@btc-vision/btc-runtime/runtime/env/global/loadMLDSA (param i32 i32)))
 (global $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain (mut i32) (i32.const 0))
 (global $~argumentsLength (mut i32) (i32.const 0))
 (global $~lib/@btc-vision/as-bignum/assembly/globals/__u256carrySub (mut i64) (i64.const 0))
 (global $~lib/@btc-vision/btc-runtime/runtime/math/bytes/EMPTY_POINTER (mut i32) (i32.const 0))
 (global $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/stringPointer (mut i32) (i32.const 0))
 (global $~lib/@btc-vision/as-bignum/assembly/globals/__u256carry (mut i64) (i64.const 0))
 (global $~lib/rt/stub/offset (mut i32) (i32.const 0))
 (global $~lib/@btc-vision/btc-runtime/runtime/math/bytes/EMPTY_BUFFER (mut i32) (i32.const 0))
 (global $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/FOUR_BYTES_UINT8ARRAY_MEMORY_CACHE (mut i32) (i32.const 0))
 (global $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/tokenURIMapPointer (mut i32) (i32.const 0))
 (global $op721/DopamilioNFT/MAX_SUPPLY (mut i32) (i32.const 0))
 (global $~lib/@btc-vision/btc-runtime/runtime/types/Address/ZERO_ADDRESS (mut i32) (i32.const 0))
 (global $~lib/@btc-vision/btc-runtime/runtime/script/Networks/Network (mut i32) (i32.const 0))
 (global $~lib/@btc-vision/btc-runtime/runtime/math/bytes/ONE_BUFFER (mut i32) (i32.const 0))
 (global $~lib/@btc-vision/btc-runtime/runtime/types/ExtendedAddressCache/_cachedDeadAddress (mut i32) (i32.const 0))
 (global $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/SCRATCH_BUF (mut i32) (i32.const 0))
 (global $~lib/@btc-vision/btc-runtime/runtime/storage/StoredString/StoredString.MAX_LENGTH_U256 (mut i32) (i32.const 0))
 (global $~lib/@btc-vision/btc-runtime/runtime/contracts/ReentrancyGuard/statusPointer (mut i32) (i32.const 0))
 (global $~lib/@btc-vision/btc-runtime/runtime/contracts/ReentrancyGuard/depthPointer (mut i32) (i32.const 0))
 (global $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/totalSupplyPointer (mut i32) (i32.const 0))
 (global $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/maxSupplyPointer (mut i32) (i32.const 0))
 (global $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/ownerOfMapPointer (mut i32) (i32.const 0))
 (global $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/tokenApprovalMapPointer (mut i32) (i32.const 0))
 (global $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/operatorApprovalMapPointer (mut i32) (i32.const 0))
 (global $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/balanceOfMapPointer (mut i32) (i32.const 0))
 (global $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/nextTokenIdPointer (mut i32) (i32.const 0))
 (global $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/ownerTokensMapPointer (mut i32) (i32.const 0))
 (global $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/tokenIndexMapPointer (mut i32) (i32.const 0))
 (global $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/initializedPointer (mut i32) (i32.const 0))
 (global $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/tokenURICounterPointer (mut i32) (i32.const 0))
 (global $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/approveNonceMapPointer (mut i32) (i32.const 0))
 (global $op721/DopamilioNFT/mintPricePointer (mut i32) (i32.const 0))
 (global $op721/DopamilioNFT/currentPhasePointer (mut i32) (i32.const 0))
 (global $op721/DopamilioNFT/treasuryPointer (mut i32) (i32.const 0))
 (global $op721/DopamilioNFT/wlMerkleRootPointer (mut i32) (i32.const 0))
 (global $op721/DopamilioNFT/mintedWlPointer (mut i32) (i32.const 0))
 (global $op721/DopamilioNFT/mintedPubPointer (mut i32) (i32.const 0))
 (global $op721/DopamilioNFT/teamMintedTotalPointer (mut i32) (i32.const 0))
 (global $~lib/@btc-vision/as-bignum/assembly/globals/__res128_hi (mut i64) (i64.const 0))
 (global $~started (mut i32) (i32.const 0))
 (memory $0 1)
 (data $0 (i32.const 1036) "\1c")
 (data $0.1 (i32.const 1048) "\02\00\00\00\08\00\00\00 \00a\00t\00 ")
 (data $1 (i32.const 1068) "\1c")
 (data $1.1 (i32.const 1080) "\02\00\00\00\02\00\00\00:")
 (data $2 (i32.const 1100) ",\00\00\00\03\00\00\00\00\00\00\00\05\00\00\00\1c\00\00\00\00\00\00\00 \04\00\00\00\00\00\00@\04\00\00\00\00\00\00@\04")
 (data $3 (i32.const 1148) "\1c\02")
 (data $3.1 (i32.const 1160) "\06\00\00\00\00\02\00\00000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f202122232425262728292a2b2c2d2e2f303132333435363738393a3b3c3d3e3f404142434445464748494a4b4c4d4e4f505152535455565758595a5b5c5d5e5f606162636465666768696a6b6c6d6e6f707172737475767778797a7b7c7d7e7f808182838485868788898a8b8c8d8e8f909192939495969798999a9b9c9d9e9fa0a1a2a3a4a5a6a7a8a9aaabacadaeafb0b1b2b3b4b5b6b7b8b9babbbcbdbebfc0c1c2c3c4c5c6c7c8c9cacbcccdcecfd0d1d2d3d4d5d6d7d8d9dadbdcdddedfe0e1e2e3e4e5e6e7e8e9eaebecedeeeff0f1f2f3f4f5f6f7f8f9fafbfcfdfeff")
 (data $4 (i32.const 1692) "|")
 (data $4.1 (i32.const 1704) "\02\00\00\00d\00\00\00t\00o\00S\00t\00r\00i\00n\00g\00(\00)\00 \00r\00a\00d\00i\00x\00 \00a\00r\00g\00u\00m\00e\00n\00t\00 \00m\00u\00s\00t\00 \00b\00e\00 \00b\00e\00t\00w\00e\00e\00n\00 \002\00 \00a\00n\00d\00 \003\006")
 (data $5 (i32.const 1820) "<")
 (data $5.1 (i32.const 1832) "\02\00\00\00&\00\00\00~\00l\00i\00b\00/\00u\00t\00i\00l\00/\00n\00u\00m\00b\00e\00r\00.\00t\00s")
 (data $6 (i32.const 1884) "\1c")
 (data $6.1 (i32.const 1896) "\02\00\00\00\02\00\00\000")
 (data $7 (i32.const 1916) "\\")
 (data $7.1 (i32.const 1928) "\02\00\00\00H\00\00\000\001\002\003\004\005\006\007\008\009\00a\00b\00c\00d\00e\00f\00g\00h\00i\00j\00k\00l\00m\00n\00o\00p\00q\00r\00s\00t\00u\00v\00w\00x\00y\00z")
 (data $8 (i32.const 2012) "\1c")
 (data $8.1 (i32.const 2024) "\02")
 (data $9 (i32.const 2044) "<")
 (data $9.1 (i32.const 2056) "\02\00\00\00$\00\00\00U\00n\00p\00a\00i\00r\00e\00d\00 \00s\00u\00r\00r\00o\00g\00a\00t\00e")
 (data $10 (i32.const 2108) ",")
 (data $10.1 (i32.const 2120) "\02\00\00\00\1c\00\00\00~\00l\00i\00b\00/\00s\00t\00r\00i\00n\00g\00.\00t\00s")
 (data $11 (i32.const 2156) "<")
 (data $11.1 (i32.const 2168) "\02\00\00\00$\00\00\00I\00n\00d\00e\00x\00 \00o\00u\00t\00 \00o\00f\00 \00r\00a\00n\00g\00e")
 (data $12 (i32.const 2220) "<")
 (data $12.1 (i32.const 2232) "\02\00\00\00$\00\00\00~\00l\00i\00b\00/\00t\00y\00p\00e\00d\00a\00r\00r\00a\00y\00.\00t\00s")
 (data $13 (i32.const 2284) ",")
 (data $13.1 (i32.const 2296) "\02\00\00\00\1c\00\00\00I\00n\00v\00a\00l\00i\00d\00 \00l\00e\00n\00g\00t\00h")
 (data $14 (i32.const 2332) "<")
 (data $14.1 (i32.const 2344) "\02\00\00\00&\00\00\00~\00l\00i\00b\00/\00a\00r\00r\00a\00y\00b\00u\00f\00f\00e\00r\00.\00t\00s")
 (data $15 (i32.const 2396) "<")
 (data $15.1 (i32.const 2408) "\02\00\00\00 \00\00\00~\00l\00i\00b\00/\00d\00a\00t\00a\00v\00i\00e\00w\00.\00t\00s")
 (data $16 (i32.const 2460) "<")
 (data $16.1 (i32.const 2472) "\02\00\00\00(\00\00\00A\00l\00l\00o\00c\00a\00t\00i\00o\00n\00 \00t\00o\00o\00 \00l\00a\00r\00g\00e")
 (data $17 (i32.const 2524) "<")
 (data $17.1 (i32.const 2536) "\02\00\00\00\1e\00\00\00~\00l\00i\00b\00/\00r\00t\00/\00s\00t\00u\00b\00.\00t\00s")
 (data $18 (i32.const 2588) "L")
 (data $18.1 (i32.const 2600) "\02\00\00\006\00\00\00I\00n\00v\00a\00l\00i\00d\00 \00p\00u\00b\00l\00i\00c\00 \00k\00e\00y\00 \00l\00e\00n\00g\00t\00h\00 \00(")
 (data $19 (i32.const 2668) "\1c")
 (data $19.1 (i32.const 2680) "\02\00\00\00\02\00\00\00)")
 (data $20 (i32.const 2700) "\1c\00\00\00\03\00\00\00\00\00\00\00\05\00\00\00\0c\00\00\000\n\00\00\00\00\00\00\80\n")
 (data $21 (i32.const 2732) "|")
 (data $21.1 (i32.const 2744) "\02\00\00\00j\00\00\00~\00l\00i\00b\00/\00@\00b\00t\00c\00-\00v\00i\00s\00i\00o\00n\00/\00b\00t\00c\00-\00r\00u\00n\00t\00i\00m\00e\00/\00r\00u\00n\00t\00i\00m\00e\00/\00t\00y\00p\00e\00s\00/\00A\00d\00d\00r\00e\00s\00s\00.\00t\00s")
 (data $22 (i32.const 2860) "\1c")
 (data $22.1 (i32.const 2872) "\01")
 (data $23 (i32.const 2892) "\9c")
 (data $23.1 (i32.const 2904) "\01\00\00\00\80")
 (data $23.2 (i32.const 2932) "\19\00\00\00\d6\00\00\00h\00\00\00\9c\00\00\00\08\00\00\00Z\00\00\00\e1\00\00\00e\00\00\00\83\00\00\00\1e\00\00\00\93\00\00\00O\00\00\00\f7\00\00\00c\00\00\00\ae\00\00\00F\00\00\00\a2\00\00\00\a6\00\00\00\c1\00\00\00r\00\00\00\b3\00\00\00\f1\00\00\00\b6\00\00\00\n\00\00\00\8c\00\00\00\e2\00\00\00o")
 (data $24 (i32.const 3052) "\9c")
 (data $24.1 (i32.const 3064) "\01\00\00\00\80")
 (data $24.2 (i32.const 3088) "\t\00\00\003\00\00\00\ea\00\00\00\01\00\00\00\ad\00\00\00\0e\00\00\00\e9\00\00\00\84\00\00\00 \00\00\00\97\00\00\00y\00\00\00\ba\00\00\00\ae\00\00\00\c3\00\00\00\ce\00\00\00\d9\00\00\00\0f\00\00\00\a3\00\00\00\f4\00\00\00\08\00\00\00q\00\00\00\95\00\00\00&\00\00\00\f8\00\00\00\d7\00\00\00\7f\00\00\00I\00\00\00C")
 (data $25 (i32.const 3212) "\9c")
 (data $25.1 (i32.const 3224) "\01\00\00\00\80\00\00\00\0f\00\00\00\91\00\00\00\88\00\00\00\f1\00\00\00<\00\00\00\b7\00\00\00\b2\00\00\00\c7\00\00\00\1f\00\00\00*\00\00\003\00\00\00^\00\00\00:\00\00\00O\00\00\00\c3\00\00\00(\00\00\00\bf\00\00\00[\00\00\00\eb\00\00\00C\00\00\00`\00\00\00\12\00\00\00\af\00\00\00\ca\00\00\00Y\00\00\00\0b\00\00\00\1a\00\00\00\11\00\00\00F\00\00\00n\00\00\00\"\00\00\00\06")
 (data $26 (i32.const 3372) "\9c")
 (data $26.1 (i32.const 3384) "\01\00\00\00\80")
 (data $26.2 (i32.const 3400) "\01\00\00\00\7f\00\00\00\85\00\00\00\10\00\00\00k\00\00\00\1f\00\00\00\ee\00\00\00\af\00\00\00/\00\00\00p\00\00\00\f1\00\00\00\e2\00\00\00\b8\00\00\00\05\00\00\00\98\00\00\00[\00\00\00\b5\00\00\00u\00\00\00\f8\00\00\00\8f\00\00\00\9b\00\00\00\0b\00\00\00\a5\00\00\00u\00\00\00=\00\00\00/\00\00\00<\00\00\00\f1\00\00\002\00\00\00s")
 (data $27 (i32.const 3532) "<")
 (data $27.1 (i32.const 3544) "\02\00\00\00$\00\00\00A\00r\00r\00a\00y\00 \00i\00s\00 \00t\00o\00o\00 \00l\00a\00r\00g\00e")
 (data $28 (i32.const 3596) "\\")
 (data $28.1 (i32.const 3608) "\02\00\00\00@\00\00\00q\00p\00z\00r\00y\009\00x\008\00g\00f\002\00t\00v\00d\00w\000\00s\003\00j\00n\005\004\00k\00h\00c\00e\006\00m\00u\00a\007\00l")
 (data $29 (i32.const 3692) "<")
 (data $29.1 (i32.const 3704) "\01\00\00\00 \00\00\00(J\e4\ac\db2\a9\9b\a3\eb\faf\a9\1d\dbA\a7\b7\a1\d2\fe\f4\159\99\"\cd\8a\04H\\\02")
 (data $30 (i32.const 3756) ",")
 (data $30.1 (i32.const 3768) "\n\00\00\00\10\00\00\00\80\0e\00\00\80\0e\00\00 \00\00\00 ")
 (data $31 (i32.const 3804) "<")
 (data $31.1 (i32.const 3816) "\01\00\00\00 ")
 (data $32 (i32.const 3868) ",")
 (data $32.1 (i32.const 3880) "\n\00\00\00\10\00\00\00\f0\0e\00\00\f0\0e\00\00 \00\00\00 ")
 (data $33 (i32.const 3916) "l")
 (data $33.1 (i32.const 3928) "\02\00\00\00P\00\00\00T\00w\00e\00a\00k\00e\00d\00 \00p\00u\00b\00l\00i\00c\00 \00k\00e\00y\00 \00m\00u\00s\00t\00 \00b\00e\00 \003\002\00 \00b\00y\00t\00e\00s\00 \00l\00o\00n\00g")
 (data $34 (i32.const 4028) "\8c")
 (data $34.1 (i32.const 4040) "\02\00\00\00z\00\00\00~\00l\00i\00b\00/\00@\00b\00t\00c\00-\00v\00i\00s\00i\00o\00n\00/\00b\00t\00c\00-\00r\00u\00n\00t\00i\00m\00e\00/\00r\00u\00n\00t\00i\00m\00e\00/\00t\00y\00p\00e\00s\00/\00E\00x\00t\00e\00n\00d\00e\00d\00A\00d\00d\00r\00e\00s\00s\00.\00t\00s")
 (data $35 (i32.const 4172) ",")
 (data $35.1 (i32.const 4184) "\02\00\00\00\1a\00\00\00~\00l\00i\00b\00/\00a\00r\00r\00a\00y\00.\00t\00s")
 (data $36 (i32.const 4220) "\1c")
 (data $36.1 (i32.const 4232) "\01")
 (data $37 (i32.const 4252) "\1c")
 (data $37.1 (i32.const 4264) "\01")
 (data $38 (i32.const 4284) "<")
 (data $38.1 (i32.const 4296) "\01\00\00\00 \00\00\00~\88\02\f1\fd#\e1\0e\r\de?\00\c0\aaH\15\d8\85\ec\d9\cd\a0\dfV\ff\a2^\ccp-E\8e")
 (data $39 (i32.const 4348) ",")
 (data $39.1 (i32.const 4360) "\n\00\00\00\10\00\00\00\d0\10\00\00\d0\10\00\00 \00\00\00 ")
 (data $40 (i32.const 4396) "<")
 (data $40.1 (i32.const 4408) "\01\00\00\00 \00\00\00p\87\994\92\1c/H\17x\87\89w\d5\b4^*Y\da\1d(\"A\c9?\f1\baj\f0\98\fc\d0")
 (data $41 (i32.const 4460) ",")
 (data $41.1 (i32.const 4472) "\n\00\00\00\10\00\00\00@\11\00\00@\11\00\00 \00\00\00 ")
 (data $42 (i32.const 4508) "<")
 (data $42.1 (i32.const 4520) "\01\00\00\00 \00\00\00\fe\e8\"\925\1d\1a\8b\ab!\c4\ef\dd\15~1h\e8\f62:\d0L\ba\12\f7|\0b\dcF\"X")
 (data $43 (i32.const 4572) ",")
 (data $43.1 (i32.const 4584) "\n\00\00\00\10\00\00\00\b0\11\00\00\b0\11\00\00 \00\00\00 ")
 (data $44 (i32.const 4620) "<")
 (data $44.1 (i32.const 4632) "\01\00\00\00 \00\00\00k\86\b2s\ff4\fc\e1\9dk\80N\ffZ?WG\ad\a4\ea\a2/\1dI\c0\1eR\dd\b7\87[K")
 (data $45 (i32.const 4684) ",")
 (data $45.1 (i32.const 4696) "\n\00\00\00\10\00\00\00 \12\00\00 \12\00\00 \00\00\00 ")
 (data $46 (i32.const 4732) "<")
 (data $46.1 (i32.const 4744) "\01\00\00\00 \00\00\00\b8n\99\da\c0GKJ\9f\c32:\d6\ed/9U\e7\b8m\c6\8cbB\82\1c\bc\ac\a2\d8y\de")
 (data $47 (i32.const 4796) ",")
 (data $47.1 (i32.const 4808) "\n\00\00\00\10\00\00\00\90\12\00\00\90\12\00\00 \00\00\00 ")
 (data $48 (i32.const 4844) "<")
 (data $48.1 (i32.const 4856) "\01\00\00\00 \00\00\00OH\06]\9e\f1E%k\f7\7f\d2\e5\8by\e6\f6\0c\d0\d3Gp\1424P\c9e\b7K\80\ed")
 (data $49 (i32.const 4908) ",")
 (data $49.1 (i32.const 4920) "\n\00\00\00\10\00\00\00\00\13\00\00\00\13\00\00 \00\00\00 ")
 (data $50 (i32.const 4956) "<")
 (data $50.1 (i32.const 4968) "\01\00\00\00 \00\00\00\f9\03\d7\be\0c\a4\99\eem}F\"\c7\92\b2\ead\ab\a6\afhQ\03\fe\c4\ae\12\d7\a6\a9\b2\0f")
 (data $51 (i32.const 5020) ",")
 (data $51.1 (i32.const 5032) "\n\00\00\00\10\00\00\00p\13\00\00p\13\00\00 \00\00\00 ")
 (data $52 (i32.const 5068) "L")
 (data $52.1 (i32.const 5080) "\02\00\00\00.\00\00\00O\00u\00t\00 \00o\00f\00 \00s\00t\00o\00r\00a\00g\00e\00 \00p\00o\00i\00n\00t\00e\00r\00.")
 (data $53 (i32.const 5148) "\9c")
 (data $53.1 (i32.const 5160) "\02\00\00\00\82\00\00\00~\00l\00i\00b\00/\00@\00b\00t\00c\00-\00v\00i\00s\00i\00o\00n\00/\00b\00t\00c\00-\00r\00u\00n\00t\00i\00m\00e\00/\00r\00u\00n\00t\00i\00m\00e\00/\00e\00n\00v\00/\00B\00l\00o\00c\00k\00c\00h\00a\00i\00n\00E\00n\00v\00i\00r\00o\00n\00m\00e\00n\00t\00.\00t\00s")
 (data $54 (i32.const 5308) "<")
 (data $54.1 (i32.const 5320) "\01\00\00\00 \00\00\00/\fc\ff\ff\fe\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff")
 (data $55 (i32.const 5372) ",")
 (data $55.1 (i32.const 5384) "\n\00\00\00\10\00\00\00\d0\14\00\00\d0\14\00\00 \00\00\00 ")
 (data $56 (i32.const 5420) "<")
 (data $56.1 (i32.const 5432) "\01\00\00\00 \00\00\00\98\17\f8\16\b1[(\d9Y(\ce-\db\fc\9b\02p\b0\87\ce\95\a0bU\ac\bb\dc\f9\eff\bey")
 (data $57 (i32.const 5484) ",")
 (data $57.1 (i32.const 5496) "\n\00\00\00\10\00\00\00@\15\00\00@\15\00\00 \00\00\00 ")
 (data $58 (i32.const 5532) "<")
 (data $58.1 (i32.const 5544) "\01\00\00\00 \00\00\00\b8\d4\10\fb\8f\d0G\9c\19T\85\a6H\b4\17\fd\a8\08\11\0e\fc\fb\a4]e\c4\a3&w\da:H")
 (data $59 (i32.const 5596) ",")
 (data $59.1 (i32.const 5608) "\n\00\00\00\10\00\00\00\b0\15\00\00\b0\15\00\00 \00\00\00 ")
 (data $60 (i32.const 5644) "|")
 (data $60.1 (i32.const 5656) "\02\00\00\00f\00\00\00~\00l\00i\00b\00/\00@\00b\00t\00c\00-\00v\00i\00s\00i\00o\00n\00/\00a\00s\00-\00b\00i\00g\00n\00u\00m\00/\00a\00s\00s\00e\00m\00b\00l\00y\00/\00i\00n\00t\00e\00g\00e\00r\00/\00u\002\005\006\00.\00t\00s")
 (data $61 (i32.const 5772) "L")
 (data $61.1 (i32.const 5784) "\02\00\00\002\00\00\00t\00r\00a\00n\00s\00f\00e\00r\00(\00a\00d\00d\00r\00e\00s\00s\00,\00u\00i\00n\00t\002\005\006\00)")
 (data $62 (i32.const 5852) "\\")
 (data $62.1 (i32.const 5864) "\02\00\00\00J\00\00\00t\00r\00a\00n\00s\00f\00e\00r\00F\00r\00o\00m\00(\00a\00d\00d\00r\00e\00s\00s\00,\00a\00d\00d\00r\00e\00s\00s\00,\00u\00i\00n\00t\002\005\006\00)")
 (data $63 (i32.const 5948) "\\")
 (data $63.1 (i32.const 5960) "\02\00\00\00F\00\00\00s\00a\00f\00e\00T\00r\00a\00n\00s\00f\00e\00r\00(\00a\00d\00d\00r\00e\00s\00s\00,\00u\00i\00n\00t\002\005\006\00,\00b\00y\00t\00e\00s\00)")
 (data $64 (i32.const 6044) "|")
 (data $64.1 (i32.const 6056) "\02\00\00\00^\00\00\00s\00a\00f\00e\00T\00r\00a\00n\00s\00f\00e\00r\00F\00r\00o\00m\00(\00a\00d\00d\00r\00e\00s\00s\00,\00a\00d\00d\00r\00e\00s\00s\00,\00u\00i\00n\00t\002\005\006\00,\00b\00y\00t\00e\00s\00)")
 (data $65 (i32.const 6172) "\\")
 (data $65.1 (i32.const 6184) "\02\00\00\00D\00\00\00i\00n\00c\00r\00e\00a\00s\00e\00A\00l\00l\00o\00w\00a\00n\00c\00e\00(\00a\00d\00d\00r\00e\00s\00s\00,\00u\00i\00n\00t\002\005\006\00)")
 (data $66 (i32.const 6268) "\\")
 (data $66.1 (i32.const 6280) "\02\00\00\00D\00\00\00d\00e\00c\00r\00e\00a\00s\00e\00A\00l\00l\00o\00w\00a\00n\00c\00e\00(\00a\00d\00d\00r\00e\00s\00s\00,\00u\00i\00n\00t\002\005\006\00)")
 (data $67 (i32.const 6364) ",")
 (data $67.1 (i32.const 6376) "\02\00\00\00\1a\00\00\00b\00u\00r\00n\00(\00u\00i\00n\00t\002\005\006\00)")
 (data $68 (i32.const 6412) "|")
 (data $68.1 (i32.const 6424) "\01\00\00\00`")
 (data $68.2 (i32.const 6443) "\80\00\00\00\80")
 (data $68.3 (i32.const 6459) "\80\00\00\00\80")
 (data $68.4 (i32.const 6487) "\80\00\00\00\80\00\00\00\80\00\00\00\80\00\00\00\80\00\00\00\00\00\00\00\80\00\00\00\80\00\00\00\80\00\00\00\00\00\00\00\80")
 (data $69 (i32.const 6540) ",")
 (data $69.1 (i32.const 6552) "\"\00\00\00\10\00\00\00 \19\00\00 \19\00\00`\00\00\00\18")
 (data $70 (i32.const 6588) "|")
 (data $70.1 (i32.const 6600) "\01\00\00\00`\00\00\00\01\00\00\00\82\80\00\00\8a\80\00\00\00\80\00\80\8b\80\00\00\01\00\00\80\81\80\00\80\t\80\00\00\8a\00\00\00\88\00\00\00\t\80\00\80\n\00\00\80\8b\80\00\80\8b\00\00\00\89\80\00\00\03\80\00\00\02\80\00\00\80\00\00\00\n\80\00\00\n\00\00\80\81\80\00\80\80\80\00\00\01\00\00\80\08\80\00\80")
 (data $71 (i32.const 6716) ",")
 (data $71.1 (i32.const 6728) "\"\00\00\00\10\00\00\00\d0\19\00\00\d0\19\00\00`\00\00\00\18")
 (data $72 (i32.const 6764) "|")
 (data $72.1 (i32.const 6776) "\01\00\00\00`\00\00\00\01\00\00\00\03\00\00\00\06\00\00\00\n\00\00\00\0f\00\00\00\15\00\00\00\1c\00\00\00$\00\00\00-\00\00\007\00\00\00\02\00\00\00\0e\00\00\00\1b\00\00\00)\00\00\008\00\00\00\08\00\00\00\19\00\00\00+\00\00\00>\00\00\00\12\00\00\00\'\00\00\00=\00\00\00\14\00\00\00,")
 (data $73 (i32.const 6892) ",")
 (data $73.1 (i32.const 6904) "\0b\00\00\00\10\00\00\00\80\1a\00\00\80\1a\00\00`\00\00\00\18")
 (data $74 (i32.const 6940) "|")
 (data $74.1 (i32.const 6952) "\01\00\00\00`\00\00\00\n\00\00\00\07\00\00\00\0b\00\00\00\11\00\00\00\12\00\00\00\03\00\00\00\05\00\00\00\10\00\00\00\08\00\00\00\15\00\00\00\18\00\00\00\04\00\00\00\0f\00\00\00\17\00\00\00\13\00\00\00\r\00\00\00\0c\00\00\00\02\00\00\00\14\00\00\00\0e\00\00\00\16\00\00\00\t\00\00\00\06\00\00\00\01")
 (data $75 (i32.const 7068) ",")
 (data $75.1 (i32.const 7080) "\0b\00\00\00\10\00\00\000\1b\00\000\1b\00\00`\00\00\00\18")
 (data $76 (i32.const 7116) "\\")
 (data $76.1 (i32.const 7128) "\02\00\00\00D\00\00\00h\00t\00t\00p\00s\00:\00/\00/\00d\00o\00p\00a\00m\00i\00l\00i\00o\00.\00x\00y\00z\00/\00a\00p\00i\00/\00m\00e\00t\00a\00d\00a\00t\00a")
 (data $77 (i32.const 7212) "L")
 (data $77.1 (i32.const 7224) "\02\00\00\00<\00\00\00h\00t\00t\00p\00s\00:\00/\00/\00d\00o\00p\00a\00m\00i\00l\00i\00o\00.\00x\00y\00z\00/\00i\00c\00o\00n\00.\00p\00n\00g")
 (data $78 (i32.const 7292) "\\")
 (data $78.1 (i32.const 7304) "\02\00\00\00@\00\00\00h\00t\00t\00p\00s\00:\00/\00/\00d\00o\00p\00a\00m\00i\00l\00i\00o\00.\00x\00y\00z\00/\00b\00a\00n\00n\00e\00r\00.\00p\00n\00g")
 (data $79 (i32.const 7388) "<")
 (data $79.1 (i32.const 7400) "\02\00\00\00*\00\00\00h\00t\00t\00p\00s\00:\00/\00/\00d\00o\00p\00a\00m\00i\00l\00i\00o\00.\00x\00y\00z")
 (data $80 (i32.const 7452) "\ac")
 (data $80.1 (i32.const 7464) "\02\00\00\00\92\00\00\003\00,\003\003\003\00 \00u\00n\00i\00q\00u\00e\00 \00d\00e\00g\00e\00n\00e\00r\00a\00t\00e\00s\00 \00e\00t\00c\00h\00e\00d\00 \00o\00n\00 \00B\00i\00t\00c\00o\00i\00n\00.\00 \001\000\000\00%\00 \00o\00n\00-\00c\00h\00a\00i\00n\00.\00 \00P\00u\00r\00e\00 \00d\00o\00p\00a\00m\00i\00n\00e\00.")
 (data $81 (i32.const 7628) "\9c")
 (data $81.1 (i32.const 7640) "\02\00\00\00~\00\00\00o\00p\00t\001\00p\00v\005\00z\000\00n\006\00g\00n\000\00n\008\00s\00z\00l\00j\00p\007\00d\00e\00w\00l\005\002\005\004\008\00z\00y\00v\00t\004\008\00p\00t\004\000\006\00c\00l\006\000\007\00w\00e\00n\002\002\00a\00m\00a\00l\00q\00f\00p\00f\00t\008\00p")
 (data $82 (i32.const 7788) "\1c")
 (data $82.1 (i32.const 7800) "\01")
 (data $83 (i32.const 7820) ",")
 (data $83.1 (i32.const 7832) "\02\00\00\00\1a\00\00\00S\00t\00o\00r\00e\00d\00B\00o\00o\00l\00e\00a\00n")
 (data $84 (i32.const 7868) "l")
 (data $84.1 (i32.const 7880) "\02\00\00\00N\00\00\00P\00o\00i\00n\00t\00e\00r\00s\00 \00m\00u\00s\00t\00 \00b\00e\00 \00e\00x\00a\00c\00t\00l\00y\00 \003\000\00 \00b\00y\00t\00e\00s\00.\00 \00G\00o\00t\00 ")
 (data $85 (i32.const 7980) ",")
 (data $85.1 (i32.const 7992) "\02\00\00\00\16\00\00\00,\00 \00c\00o\00n\00t\00e\00x\00t\00:\00 ")
 (data $86 (i32.const 8028) "\1c")
 (data $86.1 (i32.const 8040) "\02\00\00\00\02\00\00\00.")
 (data $87 (i32.const 8060) ",\00\00\00\03\00\00\00\00\00\00\00\05\00\00\00\14\00\00\00\d0\1e\00\00\00\00\00\00@\1f\00\00\00\00\00\00p\1f")
 (data $88 (i32.const 8108) "|")
 (data $88.1 (i32.const 8120) "\02\00\00\00`\00\00\00~\00l\00i\00b\00/\00@\00b\00t\00c\00-\00v\00i\00s\00i\00o\00n\00/\00b\00t\00c\00-\00r\00u\00n\00t\00i\00m\00e\00/\00r\00u\00n\00t\00i\00m\00e\00/\00m\00a\00t\00h\00/\00a\00b\00i\00.\00t\00s")
 (data $89 (i32.const 8236) ",")
 (data $89.1 (i32.const 8248) "\02\00\00\00\14\00\00\00S\00t\00o\00r\00e\00d\00U\002\005\006")
 (data $90 (i32.const 8284) "<")
 (data $90.1 (i32.const 8296) "\02\00\00\00 \00\00\00D\00i\00v\00i\00s\00i\00o\00n\00 \00b\00y\00 \00z\00e\00r\00o")
 (data $91 (i32.const 8348) "\\")
 (data $91.1 (i32.const 8360) "\02\00\00\00B\00\00\00S\00a\00f\00e\00M\00a\00t\00h\00:\00 \00m\00u\00l\00t\00i\00p\00l\00i\00c\00a\00t\00i\00o\00n\00 \00o\00v\00e\00r\00f\00l\00o\00w")
 (data $92 (i32.const 8444) "|")
 (data $92.1 (i32.const 8456) "\02\00\00\00l\00\00\00~\00l\00i\00b\00/\00@\00b\00t\00c\00-\00v\00i\00s\00i\00o\00n\00/\00b\00t\00c\00-\00r\00u\00n\00t\00i\00m\00e\00/\00r\00u\00n\00t\00i\00m\00e\00/\00t\00y\00p\00e\00s\00/\00S\00a\00f\00e\00M\00a\00t\00h\00.\00t\00s")
 (data $93 (i32.const 8572) "\1c")
 (data $93.1 (i32.const 8584) "\01")
 (data $94 (i32.const 8604) "\1c")
 (data $94.1 (i32.const 8616) "\01")
 (data $95 (i32.const 8636) "\1c")
 (data $95.1 (i32.const 8648) ":\00\00\00\08\00\00\00\01")
 (data $96 (i32.const 8668) "<")
 (data $96.1 (i32.const 8680) "\02\00\00\00(\00\00\00C\00o\00n\00t\00r\00a\00c\00t\00 \00i\00s\00 \00r\00e\00q\00u\00i\00r\00e\00d")
 (data $97 (i32.const 8732) "\8c")
 (data $97.1 (i32.const 8744) "\02\00\00\00z\00\00\00A\00t\00t\00e\00m\00p\00t\00 \00t\00o\00 \00r\00e\00a\00d\00 \00b\00e\00y\00o\00n\00d\00 \00b\00u\00f\00f\00e\00r\00 \00l\00e\00n\00g\00t\00h\00.\00 \00R\00e\00q\00u\00e\00s\00t\00e\00d\00 \00u\00p\00 \00t\00o\00 \00o\00f\00f\00s\00e\00t\00 ")
 (data $98 (i32.const 8876) "\1c")
 (data $98.1 (i32.const 8888) "\02\00\00\00\04\00\00\00,\00 ")
 (data $99 (i32.const 8908) "\1c\00\00\00\03\00\00\00\00\00\00\00\05\00\00\00\0c\00\00\000\"\00\00\00\00\00\00\c0\"")
 (data $100 (i32.const 8940) "<")
 (data $100.1 (i32.const 8952) "\02\00\00\00&\00\00\00b\00u\00t\00 \00b\00u\00f\00f\00e\00r\00 \00i\00s\00 \00o\00n\00l\00y\00 ")
 (data $101 (i32.const 9004) ",")
 (data $101.1 (i32.const 9016) "\02\00\00\00\0e\00\00\00 \00b\00y\00t\00e\00s\00.")
 (data $102 (i32.const 9052) "\1c\00\00\00\03\00\00\00\00\00\00\00\05\00\00\00\0c\00\00\00\00#\00\00\00\00\00\00@#")
 (data $103 (i32.const 9084) "\8c")
 (data $103.1 (i32.const 9096) "\02\00\00\00t\00\00\00~\00l\00i\00b\00/\00@\00b\00t\00c\00-\00v\00i\00s\00i\00o\00n\00/\00b\00t\00c\00-\00r\00u\00n\00t\00i\00m\00e\00/\00r\00u\00n\00t\00i\00m\00e\00/\00b\00u\00f\00f\00e\00r\00/\00B\00y\00t\00e\00s\00R\00e\00a\00d\00e\00r\00.\00t\00s")
 (data $104 (i32.const 9228) "\1c")
 (data $104.1 (i32.const 9240) "\01")
 (data $105 (i32.const 9260) "L")
 (data $105.1 (i32.const 9272) "\02\00\00\006\00\00\00C\00a\00n\00n\00o\00t\00 \00m\00o\00d\00i\00f\00y\00 \00a\00d\00d\00r\00e\00s\00s\00 \00d\00a\00t\00a\00.")
 (data $106 (i32.const 9340) "<")
 (data $106.1 (i32.const 9352) "\02\00\00\00(\00\00\00C\00h\00a\00i\00n\00 \00i\00d\00 \00i\00s\00 \00r\00e\00q\00u\00i\00r\00e\00d")
 (data $107 (i32.const 9404) "|")
 (data $107.1 (i32.const 9416) "\02\00\00\00^\00\00\00U\00n\00e\00x\00p\00e\00c\00t\00e\00d\00 \00\'\00n\00u\00l\00l\00\'\00 \00(\00n\00o\00t\00 \00a\00s\00s\00i\00g\00n\00e\00d\00 \00o\00r\00 \00f\00a\00i\00l\00e\00d\00 \00c\00a\00s\00t\00)")
 (data $108 (i32.const 9532) "L")
 (data $108.1 (i32.const 9544) "\02\00\00\00.\00\00\00I\00n\00v\00a\00l\00i\00d\00 \00c\00h\00a\00i\00n\00 \00i\00d\00 \00l\00e\00n\00g\00t\00h")
 (data $109 (i32.const 9612) "\8c")
 (data $109.1 (i32.const 9624) "\02\00\00\00n\00\00\00~\00l\00i\00b\00/\00@\00b\00t\00c\00-\00v\00i\00s\00i\00o\00n\00/\00b\00t\00c\00-\00r\00u\00n\00t\00i\00m\00e\00/\00r\00u\00n\00t\00i\00m\00e\00/\00s\00c\00r\00i\00p\00t\00/\00N\00e\00t\00w\00o\00r\00k\00s\00.\00t\00s")
 (data $110 (i32.const 9756) "<")
 (data $110.1 (i32.const 9768) "\02\00\00\00 \00\00\00U\00n\00k\00n\00o\00w\00n\00 \00c\00h\00a\00i\00n\00 \00i\00d")
 (data $111 (i32.const 9820) "|")
 (data $111.1 (i32.const 9832) "\02\00\00\00^\00\00\00E\00l\00e\00m\00e\00n\00t\00 \00t\00y\00p\00e\00 \00m\00u\00s\00t\00 \00b\00e\00 \00n\00u\00l\00l\00a\00b\00l\00e\00 \00i\00f\00 \00a\00r\00r\00a\00y\00 \00i\00s\00 \00h\00o\00l\00e\00y")
 (data $112 (i32.const 9948) ",")
 (data $112.1 (i32.const 9960) "\02\00\00\00\14\00\00\00d\00e\00p\00l\00o\00y\00e\00r\00(\00)")
 (data $113 (i32.const 9996) "l")
 (data $113.1 (i32.const 10008) "\02\00\00\00T\00\00\00b\00y\00t\00e\00s\00T\00o\00U\003\002\00:\00 \00i\00n\00p\00u\00t\00 \00m\00u\00s\00t\00 \00b\00e\00 \00a\00t\00 \00l\00e\00a\00s\00t\00 \004\00 \00b\00y\00t\00e\00s")
 (data $114 (i32.const 10108) "|")
 (data $114.1 (i32.const 10120) "\02\00\00\00d\00\00\00~\00l\00i\00b\00/\00@\00b\00t\00c\00-\00v\00i\00s\00i\00o\00n\00/\00b\00t\00c\00-\00r\00u\00n\00t\00i\00m\00e\00/\00r\00u\00n\00t\00i\00m\00e\00/\00m\00a\00t\00h\00/\00b\00y\00t\00e\00s\00.\00t\00s")
 (data $115 (i32.const 10236) "<")
 (data $115.1 (i32.const 10248) "\02\00\00\00(\00\00\00D\00e\00p\00l\00o\00y\00e\00r\00 \00i\00s\00 \00r\00e\00q\00u\00i\00r\00e\00d")
 (data $116 (i32.const 10300) "<")
 (data $116.1 (i32.const 10312) "\02\00\00\00(\00\00\00A\00d\00d\00r\00e\00s\00s\00 \00i\00s\00 \00t\00o\00o\00 \00l\00o\00n\00g\00 ")
 (data $117 (i32.const 10364) "\1c")
 (data $117.1 (i32.const 10376) "\02\00\00\00\06\00\00\00 \00>\00 ")
 (data $118 (i32.const 10396) "\1c")
 (data $118.1 (i32.const 10408) "\02\00\00\00\0c\00\00\00 \00b\00y\00t\00e\00s")
 (data $119 (i32.const 10428) ",\00\00\00\03\00\00\00\00\00\00\00\05\00\00\00\14\00\00\00P(\00\00\00\00\00\00\90(\00\00\00\00\00\00\b0(")
 (data $120 (i32.const 10476) "\8c")
 (data $120.1 (i32.const 10488) "\02\00\00\00t\00\00\00~\00l\00i\00b\00/\00@\00b\00t\00c\00-\00v\00i\00s\00i\00o\00n\00/\00b\00t\00c\00-\00r\00u\00n\00t\00i\00m\00e\00/\00r\00u\00n\00t\00i\00m\00e\00/\00b\00u\00f\00f\00e\00r\00/\00B\00y\00t\00e\00s\00W\00r\00i\00t\00e\00r\00.\00t\00s")
 (data $121 (i32.const 10620) "L")
 (data $121.1 (i32.const 10632) "\02\00\00\008\00\00\00B\00y\00t\00e\00s\00W\00r\00i\00t\00e\00r\00:\00 \00o\00f\00f\00s\00e\00t\00 \00o\00v\00e\00r\00f\00l\00o\00w")
 (data $122 (i32.const 10700) "\8c")
 (data $122.1 (i32.const 10712) "\02\00\00\00p\00\00\00B\00u\00f\00f\00e\00r\00 \00i\00s\00 \00g\00e\00t\00t\00i\00n\00g\00 \00r\00e\00s\00i\00z\00e\00d\00.\00 \00T\00h\00i\00s\00 \00i\00s\00 \00b\00a\00d\00 \00f\00o\00r\00 \00p\00e\00r\00f\00o\00r\00m\00a\00n\00c\00e\00.\00 ")
 (data $123 (i32.const 10844) "<")
 (data $123.1 (i32.const 10856) "\02\00\00\00\1e\00\00\00E\00x\00p\00e\00c\00t\00e\00d\00 \00s\00i\00z\00e\00:\00 ")
 (data $124 (i32.const 10908) "\1c")
 (data $124.1 (i32.const 10920) "\02\00\00\00\06\00\00\00 \00-\00 ")
 (data $125 (i32.const 10940) "\1c\00\00\00\03\00\00\00\00\00\00\00\05\00\00\00\0c\00\00\00p*\00\00\00\00\00\00\b0*")
 (data $126 (i32.const 10972) ",")
 (data $126.1 (i32.const 10984) "\02\00\00\00\1c\00\00\00C\00u\00r\00r\00e\00n\00t\00 \00s\00i\00z\00e\00:\00 ")
 (data $127 (i32.const 11020) "<")
 (data $127.1 (i32.const 11032) "\02\00\00\00$\00\00\00M\00e\00t\00h\00o\00d\00 \00n\00o\00t\00 \00f\00o\00u\00n\00d\00:\00 ")
 (data $128 (i32.const 11084) "\8c")
 (data $128.1 (i32.const 11096) "\02\00\00\00p\00\00\00~\00l\00i\00b\00/\00@\00b\00t\00c\00-\00v\00i\00s\00i\00o\00n\00/\00b\00t\00c\00-\00r\00u\00n\00t\00i\00m\00e\00/\00r\00u\00n\00t\00i\00m\00e\00/\00c\00o\00n\00t\00r\00a\00c\00t\00s\00/\00O\00P\00_\00N\00E\00T\00.\00t\00s")
 (data $129 (i32.const 11228) "L")
 (data $129.1 (i32.const 11240) "\02\00\00\00:\00\00\00P\00o\00i\00n\00t\00e\00r\00 \00m\00u\00s\00t\00 \00b\00e\00 \003\002\00 \00b\00y\00t\00e\00s\00 \00l\00o\00n\00g")
 (data $130 (i32.const 11308) "\\")
 (data $130.1 (i32.const 11320) "\02\00\00\00B\00\00\00K\00e\00y\00 \00n\00o\00t\00 \00f\00o\00u\00n\00d\00 \00i\00n\00 \00m\00a\00p\00 \00(\00u\00i\00n\00t\008\00a\00r\00r\00a\00y\00)")
 (data $131 (i32.const 11404) "\8c")
 (data $131.1 (i32.const 11416) "\02\00\00\00z\00\00\00~\00l\00i\00b\00/\00@\00b\00t\00c\00-\00v\00i\00s\00i\00o\00n\00/\00b\00t\00c\00-\00r\00u\00n\00t\00i\00m\00e\00/\00r\00u\00n\00t\00i\00m\00e\00/\00g\00e\00n\00e\00r\00i\00c\00/\00M\00a\00p\00U\00i\00n\00t\008\00A\00r\00r\00a\00y\00.\00t\00s")
 (data $132 (i32.const 11548) "L")
 (data $132.1 (i32.const 11560) "\02\00\00\00.\00\00\00R\00e\00e\00n\00t\00r\00a\00n\00c\00y\00G\00u\00a\00r\00d\00:\00 \00L\00O\00C\00K\00E\00D")
 (data $133 (i32.const 11628) "\9c")
 (data $133.1 (i32.const 11640) "\02\00\00\00\82\00\00\00~\00l\00i\00b\00/\00@\00b\00t\00c\00-\00v\00i\00s\00i\00o\00n\00/\00b\00t\00c\00-\00r\00u\00n\00t\00i\00m\00e\00/\00r\00u\00n\00t\00i\00m\00e\00/\00c\00o\00n\00t\00r\00a\00c\00t\00s\00/\00R\00e\00e\00n\00t\00r\00a\00n\00c\00y\00G\00u\00a\00r\00d\00.\00t\00s")
 (data $134 (i32.const 11788) "\\")
 (data $134.1 (i32.const 11800) "\02\00\00\00F\00\00\00R\00e\00e\00n\00t\00r\00a\00n\00c\00y\00G\00u\00a\00r\00d\00:\00 \00M\00a\00x\00 \00d\00e\00p\00t\00h\00 \00e\00x\00c\00e\00e\00d\00e\00d")
 (data $135 (i32.const 11884) "L")
 (data $135.1 (i32.const 11896) "\02\00\00\006\00\00\00S\00a\00f\00e\00M\00a\00t\00h\00:\00 \00a\00d\00d\00i\00t\00i\00o\00n\00 \00o\00v\00e\00r\00f\00l\00o\00w")
 (data $136 (i32.const 11964) "\\")
 (data $136.1 (i32.const 11976) "\02\00\00\00>\00\00\00D\00o\00p\00a\00m\00i\00l\00i\00o\00N\00F\00T\00:\00 \00n\00o\00n\00e\00x\00i\00s\00t\00e\00n\00t\00 \00t\00o\00k\00e\00n")
 (data $137 (i32.const 12060) "<")
 (data $137.1 (i32.const 12072) "\02\00\00\00*\00\00\00o\00p\007\002\001\00/\00D\00o\00p\00a\00m\00i\00l\00i\00o\00N\00F\00T\00.\00t\00s")
 (data $138 (i32.const 12124) "\\")
 (data $138.1 (i32.const 12136) "\02\00\00\00F\00\00\00b\00i\00g\00E\00n\00d\00i\00a\00n\00A\00d\00d\00:\00 \00b\00a\00s\00e\00 \00m\00u\00s\00t\00 \00b\00e\00 \003\002\00 \00b\00y\00t\00e\00s")
 (data $139 (i32.const 12220) "l")
 (data $139.1 (i32.const 12232) "\02\00\00\00N\00\00\00a\00d\00d\00U\00i\00n\00t\008\00A\00r\00r\00a\00y\00s\00B\00E\00 \00e\00x\00p\00e\00c\00t\00s\00 \003\002\00-\00b\00y\00t\00e\00 \00i\00n\00p\00u\00t\00s")
 (data $140 (i32.const 12332) "\1c")
 (data $140.1 (i32.const 12344) "\02\00\00\00\02\00\00\00/")
 (data $141 (i32.const 12364) "l")
 (data $141.1 (i32.const 12376) "\02\00\00\00N\00\00\00r\00a\00d\00i\00x\00 \00a\00r\00g\00u\00m\00e\00n\00t\00 \00m\00u\00s\00t\00 \00b\00e\00 \00b\00e\00t\00w\00e\00e\00n\00 \001\000\00 \00o\00r\00 \001\006")
 (data $142 (i32.const 12476) "<")
 (data $142.1 (i32.const 12488) "\02\00\00\00 \00\00\000\001\002\003\004\005\006\007\008\009\00a\00b\00c\00d\00e\00f")
 (data $143 (i32.const 12540) "l")
 (data $143.1 (i32.const 12552) "\02\00\00\00X\00\00\00~\00l\00i\00b\00/\00@\00b\00t\00c\00-\00v\00i\00s\00i\00o\00n\00/\00a\00s\00-\00b\00i\00g\00n\00u\00m\00/\00a\00s\00s\00e\00m\00b\00l\00y\00/\00u\00t\00i\00l\00s\00.\00t\00s")
 (data $144 (i32.const 12652) "\1c")
 (data $144.1 (i32.const 12664) "\02\00\00\00\n\00\00\00.\00j\00s\00o\00n")
 (data $145 (i32.const 12684) "L")
 (data $145.1 (i32.const 12696) "\02\00\00\00.\00\00\00T\00r\00a\00n\00s\00a\00c\00t\00i\00o\00n\00 \00i\00s\00 \00r\00e\00q\00u\00i\00r\00e\00d")
 (data $146 (i32.const 12764) "\\")
 (data $146.1 (i32.const 12776) "\02\00\00\00>\00\00\00D\00o\00p\00a\00m\00i\00l\00i\00o\00N\00F\00T\00:\00 \00d\00i\00r\00e\00c\00t\00 \00c\00a\00l\00l\00s\00 \00o\00n\00l\00y")
 (data $147 (i32.const 12860) "\\")
 (data $147.1 (i32.const 12872) "\02\00\00\00@\00\00\00D\00o\00p\00a\00m\00i\00l\00i\00o\00N\00F\00T\00:\00 \00a\00m\00o\00u\00n\00t\00 \00m\00u\00s\00t\00 \00b\00e\00 \00>\00 \000")
 (data $148 (i32.const 12956) "L")
 (data $148.1 (i32.const 12968) "\02\00\00\006\00\00\00D\00o\00p\00a\00m\00i\00l\00i\00o\00N\00F\00T\00:\00 \00m\00a\00x\00 \001\000\00 \00p\00e\00r\00 \00t\00x")
 (data $149 (i32.const 13036) "L")
 (data $149.1 (i32.const 13048) "\02\00\00\00<\00\00\00D\00o\00p\00a\00m\00i\00l\00i\00o\00N\00F\00T\00:\00 \00m\00i\00n\00t\00 \00n\00o\00t\00 \00s\00t\00a\00r\00t\00e\00d")
 (data $150 (i32.const 13116) "l")
 (data $150.1 (i32.const 13128) "\02\00\00\00P\00\00\00D\00o\00p\00a\00m\00i\00l\00i\00o\00N\00F\00T\00:\00 \00t\00e\00a\00m\00 \00p\00h\00a\00s\00e\00 \00\14  \00d\00e\00p\00l\00o\00y\00e\00r\00 \00o\00n\00l\00y")
 (data $151 (i32.const 13228) "l")
 (data $151.1 (i32.const 13240) "\02\00\00\00\\\00\00\00D\00o\00p\00a\00m\00i\00l\00i\00o\00N\00F\00T\00:\00 \00t\00e\00a\00m\00 \00c\00a\00p\00 \00e\00x\00c\00e\00e\00d\00e\00d\00 \00(\00m\00a\00x\00 \001\000\00 \00t\00o\00t\00a\00l\00)")
 (data $152 (i32.const 13340) "l")
 (data $152.1 (i32.const 13352) "\02\00\00\00\\\00\00\00N\00G\00M\00I\00 \00a\00n\00o\00n\00 \00\14  \00u\00r\00 \00n\00o\00t\00 \00o\00n\00 \00t\00h\00e\00 \00l\00i\00s\00t\00,\00 \00g\00o\00 \00t\00o\00u\00c\00h\00 \00g\00r\00a\00s\00s")
 (data $153 (i32.const 13452) "<")
 (data $153.1 (i32.const 13464) "\02\00\00\00 \00\00\00A\00d\00d\00r\00e\00s\00s\00M\00e\00m\00o\00r\00y\00M\00a\00p")
 (data $154 (i32.const 13516) "|")
 (data $154.1 (i32.const 13528) "\02\00\00\00d\00\00\00g\00r\00e\00e\00d\00y\00 \00a\00n\00o\00n\00 \00\14  \003\00 \00i\00s\00 \00e\00n\00o\00u\00g\00h\00,\00 \00u\00 \00a\00l\00r\00e\00a\00d\00y\00 \00m\00i\00n\00t\00e\00d\00 \00u\00r\00 \00b\00a\00g")
 (data $155 (i32.const 13644) "\\")
 (data $155.1 (i32.const 13656) "\02\00\00\00B\00\00\00D\00o\00p\00a\00m\00i\00l\00i\00o\00N\00F\00T\00:\00 \00p\00u\00b\00l\00i\00c\00 \00c\00a\00p\00 \00e\00x\00c\00e\00e\00d\00e\00d")
 (data $156 (i32.const 13740) "L")
 (data $156.1 (i32.const 13752) "\02\00\00\00<\00\00\00D\00o\00p\00a\00m\00i\00l\00i\00o\00N\00F\00T\00:\00 \00s\00u\00p\00p\00l\00y\00 \00e\00x\00h\00a\00u\00s\00t\00e\00d")
 (data $157 (i32.const 13820) "\9c")
 (data $157.1 (i32.const 13832) "\02\00\00\00~\00\00\00~\00l\00i\00b\00/\00@\00b\00t\00c\00-\00v\00i\00s\00i\00o\00n\00/\00b\00t\00c\00-\00r\00u\00n\00t\00i\00m\00e\00/\00r\00u\00n\00t\00i\00m\00e\00/\00e\00n\00v\00/\00c\00l\00a\00s\00s\00e\00s\00/\00T\00r\00a\00n\00s\00a\00c\00t\00i\00o\00n\00.\00t\00s")
 (data $158 (i32.const 13980) "L")
 (data $158.1 (i32.const 13992) "\02\00\00\00:\00\00\00D\00o\00p\00a\00m\00i\00l\00i\00o\00N\00F\00T\00:\00 \00m\00i\00s\00s\00i\00n\00g\00 \00o\00u\00t\00p\00u\00t\00s")
 (data $159 (i32.const 14060) "L")
 (data $159.1 (i32.const 14072) "\02\00\00\00<\00\00\00D\00o\00p\00a\00m\00i\00l\00i\00o\00N\00F\00T\00:\00 \00t\00r\00e\00a\00s\00u\00r\00y\00 \00n\00o\00t\00 \00s\00e\00t")
 (data $160 (i32.const 14140) "\\")
 (data $160.1 (i32.const 14152) "\02\00\00\00D\00\00\00D\00o\00p\00a\00m\00i\00l\00i\00o\00N\00F\00T\00:\00 \00i\00n\00s\00u\00f\00f\00i\00c\00i\00e\00n\00t\00 \00p\00a\00y\00m\00e\00n\00t")
 (data $161 (i32.const 14236) "\1c")
 (data $161.1 (i32.const 14248) "\01")
 (data $162 (i32.const 14268) "L")
 (data $162.1 (i32.const 14280) "\02\00\00\006\00\00\00C\00a\00n\00n\00o\00t\00 \00m\00i\00n\00t\00 \00t\00o\00 \00z\00e\00r\00o\00 \00a\00d\00d\00r\00e\00s\00s")
 (data $163 (i32.const 14348) "\8c")
 (data $163.1 (i32.const 14360) "\02\00\00\00n\00\00\00~\00l\00i\00b\00/\00@\00b\00t\00c\00-\00v\00i\00s\00i\00o\00n\00/\00b\00t\00c\00-\00r\00u\00n\00t\00i\00m\00e\00/\00r\00u\00n\00t\00i\00m\00e\00/\00c\00o\00n\00t\00r\00a\00c\00t\00s\00/\00O\00P\007\002\001\00.\00t\00s")
 (data $164 (i32.const 14492) "<")
 (data $164.1 (i32.const 14504) "\02\00\00\00(\00\00\00T\00o\00k\00e\00n\00 \00a\00l\00r\00e\00a\00d\00y\00 \00e\00x\00i\00s\00t\00s")
 (data $165 (i32.const 14556) "<")
 (data $165.1 (i32.const 14568) "\02\00\00\00$\00\00\00M\00a\00x\00 \00s\00u\00p\00p\00l\00y\00 \00r\00e\00a\00c\00h\00e\00d")
 (data $166 (i32.const 14620) "<")
 (data $166.1 (i32.const 14632) "\02\00\00\00\"\00\00\00S\00t\00o\00r\00e\00d\00P\00a\00c\00k\00e\00d\00A\00r\00r\00a\00y")
 (data $167 (i32.const 14684) "\1c")
 (data $167.1 (i32.const 14696) "\01\00\00\00\08")
 (data $168 (i32.const 14716) "<")
 (data $168.1 (i32.const 14728) "\02\00\00\00$\00\00\00K\00e\00y\00 \00d\00o\00e\00s\00 \00n\00o\00t\00 \00e\00x\00i\00s\00t")
 (data $169 (i32.const 14780) ",")
 (data $169.1 (i32.const 14792) "\02\00\00\00\16\00\00\00~\00l\00i\00b\00/\00m\00a\00p\00.\00t\00s")
 (data $170 (i32.const 14828) "\\")
 (data $170.1 (i32.const 14840) "\02\00\00\00D\00\00\00p\00u\00s\00h\00:\00 \00a\00r\00r\00a\00y\00 \00h\00a\00s\00 \00r\00e\00a\00c\00h\00e\00d\00 \00M\00A\00X\00_\00L\00E\00N\00G\00T\00H")
 (data $171 (i32.const 14924) "\ac")
 (data $171.1 (i32.const 14936) "\02\00\00\00\90\00\00\00~\00l\00i\00b\00/\00@\00b\00t\00c\00-\00v\00i\00s\00i\00o\00n\00/\00b\00t\00c\00-\00r\00u\00n\00t\00i\00m\00e\00/\00r\00u\00n\00t\00i\00m\00e\00/\00s\00t\00o\00r\00a\00g\00e\00/\00a\00r\00r\00a\00y\00s\00/\00S\00t\00o\00r\00e\00d\00P\00a\00c\00k\00e\00d\00A\00r\00r\00a\00y\00.\00t\00s")
 (data $172 (i32.const 15100) "l")
 (data $172.1 (i32.const 15112) "\02\00\00\00R\00\00\00E\00v\00e\00n\00t\00 \00d\00a\00t\00a\00 \00l\00e\00n\00g\00t\00h\00 \00e\00x\00c\00e\00e\00d\00s\00 \00m\00a\00x\00i\00m\00u\00m\00 \00l\00e\00n\00g\00t\00h\00.")
 (data $173 (i32.const 15212) "\8c")
 (data $173.1 (i32.const 15224) "\02\00\00\00n\00\00\00~\00l\00i\00b\00/\00@\00b\00t\00c\00-\00v\00i\00s\00i\00o\00n\00/\00b\00t\00c\00-\00r\00u\00n\00t\00i\00m\00e\00/\00r\00u\00n\00t\00i\00m\00e\00/\00e\00v\00e\00n\00t\00s\00/\00N\00e\00t\00E\00v\00e\00n\00t\00.\00t\00s")
 (data $174 (i32.const 15356) "\1c")
 (data $174.1 (i32.const 15368) "\02\00\00\00\0c\00\00\00M\00i\00n\00t\00e\00d")
 (data $175 (i32.const 15388) "<")
 (data $175.1 (i32.const 15400) "\02\00\00\00*\00\00\00B\00u\00f\00f\00e\00r\00 \00i\00s\00 \00n\00o\00t\00 \00d\00e\00f\00i\00n\00e\00d")
 (data $176 (i32.const 15452) "\\")
 (data $176.1 (i32.const 15464) "\02\00\00\00D\00\00\00O\00n\00l\00y\00 \00d\00e\00p\00l\00o\00y\00e\00r\00 \00c\00a\00n\00 \00c\00a\00l\00l\00 \00t\00h\00i\00s\00 \00m\00e\00t\00h\00o\00d")
 (data $177 (i32.const 15548) "\\")
 (data $177.1 (i32.const 15560) "\02\00\00\00F\00\00\00D\00o\00p\00a\00m\00i\00l\00i\00o\00N\00F\00T\00:\00 \00p\00h\00a\00s\00e\00 \00a\00l\00r\00e\00a\00d\00y\00 \00s\00t\00a\00r\00t\00e\00d")
 (data $178 (i32.const 15644) ",")
 (data $178.1 (i32.const 15656) "\02\00\00\00\1c\00\00\00P\00h\00a\00s\00e\00A\00c\00t\00i\00v\00a\00t\00e\00d")
 (data $179 (i32.const 15692) "\\")
 (data $179.1 (i32.const 15704) "\02\00\00\00F\00\00\00D\00o\00p\00a\00m\00i\00l\00i\00o\00N\00F\00T\00:\00 \00m\00u\00s\00t\00 \00b\00e\00 \00i\00n\00 \00T\00E\00A\00M\00 \00p\00h\00a\00s\00e")
 (data $180 (i32.const 15788) "L")
 (data $180.1 (i32.const 15800) "\02\00\00\00:\00\00\00D\00o\00p\00a\00m\00i\00l\00i\00o\00N\00F\00T\00:\00 \00W\00L\00 \00r\00o\00o\00t\00 \00n\00o\00t\00 \00s\00e\00t")
 (data $181 (i32.const 15868) "\\")
 (data $181.1 (i32.const 15880) "\02\00\00\00B\00\00\00D\00o\00p\00a\00m\00i\00l\00i\00o\00N\00F\00T\00:\00 \00m\00u\00s\00t\00 \00b\00e\00 \00i\00n\00 \00W\00L\00 \00p\00h\00a\00s\00e")
 (data $182 (i32.const 15964) "\\")
 (data $182.1 (i32.const 15976) "\02\00\00\00B\00\00\00D\00o\00p\00a\00m\00i\00l\00i\00o\00N\00F\00T\00:\00 \00r\00o\00o\00t\00 \00c\00a\00n\00n\00o\00t\00 \00b\00e\00 \00z\00e\00r\00o")
 (data $183 (i32.const 16060) ",")
 (data $183.1 (i32.const 16072) "\02\00\00\00\12\00\00\00W\00L\00R\00o\00o\00t\00S\00e\00t")
 (data $184 (i32.const 16108) "\\")
 (data $184.1 (i32.const 16120) "\02\00\00\00>\00\00\00D\00o\00p\00a\00m\00i\00l\00i\00o\00N\00F\00T\00:\00 \00p\00r\00i\00c\00e\00 \00m\00u\00s\00t\00 \00b\00e\00 \00>\00 \000")
 (data $185 (i32.const 16204) "L")
 (data $185.1 (i32.const 16216) "\02\00\00\006\00\00\00D\00o\00p\00a\00m\00i\00l\00i\00o\00N\00F\00T\00:\00 \00e\00m\00p\00t\00y\00 \00a\00d\00d\00r\00e\00s\00s")
 (data $186 (i32.const 16284) "L")
 (data $186.1 (i32.const 16296) "\02\00\00\002\00\00\00:\00 \00v\00a\00l\00u\00e\00 \00i\00s\00 \00t\00o\00o\00 \00l\00o\00n\00g\00 \00(\00m\00a\00x\00=")
 (data $187 (i32.const 16364) ",\00\00\00\03\00\00\00\00\00\00\00\05\00\00\00\10\00\00\00\00\00\00\00\b0?\00\00\00\00\00\00\80\n")
 (data $188 (i32.const 16412) "\9c")
 (data $188.1 (i32.const 16424) "\02\00\00\00\80\00\00\00~\00l\00i\00b\00/\00@\00b\00t\00c\00-\00v\00i\00s\00i\00o\00n\00/\00b\00t\00c\00-\00r\00u\00n\00t\00i\00m\00e\00/\00r\00u\00n\00t\00i\00m\00e\00/\00s\00t\00o\00r\00a\00g\00e\00/\00B\00a\00s\00e\00S\00t\00o\00r\00e\00d\00S\00t\00r\00i\00n\00g\00.\00t\00s")
 (data $189 (i32.const 16572) "<")
 (data $189.1 (i32.const 16584) "\02\00\00\00\1e\00\00\00T\00r\00e\00a\00s\00u\00r\00y\00U\00p\00d\00a\00t\00e\00d")
 (data $190 (i32.const 16636) "<")
 (data $190.1 (i32.const 16648) "\02\00\00\00(\00\00\00T\00o\00k\00e\00n\00 \00d\00o\00e\00s\00 \00n\00o\00t\00 \00e\00x\00i\00s\00t")
 (data $191 (i32.const 16700) "<")
 (data $191.1 (i32.const 16712) "\02\00\00\00(\00\00\00I\00c\00o\00n\00 \00c\00a\00n\00n\00o\00t\00 \00b\00e\00 \00e\00m\00p\00t\00y")
 (data $192 (i32.const 16764) "<")
 (data $192.1 (i32.const 16776) "\02\00\00\00,\00\00\00B\00a\00n\00n\00e\00r\00 \00c\00a\00n\00n\00o\00t\00 \00b\00e\00 \00e\00m\00p\00t\00y")
 (data $193 (i32.const 16828) "L")
 (data $193.1 (i32.const 16840) "\02\00\00\006\00\00\00D\00e\00s\00c\00r\00i\00p\00t\00i\00o\00n\00 \00c\00a\00n\00n\00o\00t\00 \00b\00e\00 \00e\00m\00p\00t\00y")
 (data $194 (i32.const 16908) "L")
 (data $194.1 (i32.const 16920) "\02\00\00\00.\00\00\00W\00e\00b\00s\00i\00t\00e\00 \00c\00a\00n\00n\00o\00t\00 \00b\00e\00 \00e\00m\00p\00t\00y")
 (data $195 (i32.const 16988) "<")
 (data $195.1 (i32.const 17000) "\02\00\00\00\1e\00\00\00I\00n\00v\00a\00l\00i\00d\00 \00a\00d\00d\00r\00e\00s\00s")
 (data $196 (i32.const 17052) "\1c")
 (data $196.1 (i32.const 17064) "\01")
 (data $197 (i32.const 17084) ",")
 (data $197.1 (i32.const 17096) "\02\00\00\00\1c\00\00\00I\00n\00v\00a\00l\00i\00d\00 \00s\00e\00n\00d\00e\00r")
 (data $198 (i32.const 17132) "<")
 (data $198.1 (i32.const 17144) "\02\00\00\00 \00\00\00I\00n\00v\00a\00l\00i\00d\00 \00r\00e\00c\00e\00i\00v\00e\00r")
 (data $199 (i32.const 17196) "L")
 (data $199.1 (i32.const 17208) "\02\00\00\00:\00\00\00T\00r\00a\00n\00s\00f\00e\00r\00 \00f\00r\00o\00m\00 \00i\00n\00c\00o\00r\00r\00e\00c\00t\00 \00o\00w\00n\00e\00r")
 (data $200 (i32.const 17276) "L")
 (data $200.1 (i32.const 17288) "\02\00\00\004\00\00\00K\00e\00y\00 \00n\00o\00t\00 \00f\00o\00u\00n\00d\00 \00i\00n\00 \00m\00a\00p\00 \00(\00M\00a\00p\00)")
 (data $201 (i32.const 17356) "|")
 (data $201.1 (i32.const 17368) "\02\00\00\00f\00\00\00~\00l\00i\00b\00/\00@\00b\00t\00c\00-\00v\00i\00s\00i\00o\00n\00/\00b\00t\00c\00-\00r\00u\00n\00t\00i\00m\00e\00/\00r\00u\00n\00t\00i\00m\00e\00/\00g\00e\00n\00e\00r\00i\00c\00/\00M\00a\00p\00.\00t\00s")
 (data $202 (i32.const 17484) "L")
 (data $202.1 (i32.const 17496) "\02\00\00\004\00\00\00N\00o\00t\00 \00a\00u\00t\00h\00o\00r\00i\00z\00e\00d\00 \00t\00o\00 \00t\00r\00a\00n\00s\00f\00e\00r")
 (data $203 (i32.const 17564) "<")
 (data $203.1 (i32.const 17576) "\02\00\00\00(\00\00\00T\00o\00k\00e\00n\00 \00a\00r\00r\00a\00y\00 \00i\00s\00 \00e\00m\00p\00t\00y")
 (data $204 (i32.const 17628) "<")
 (data $204.1 (i32.const 17640) "\02\00\00\00\"\00\00\00g\00e\00t\00:\00 \00o\00u\00t\00 \00o\00f\00 \00r\00a\00n\00g\00e")
 (data $205 (i32.const 17692) "l")
 (data $205.1 (i32.const 17704) "\02\00\00\00X\00\00\00s\00e\00t\00:\00 \00i\00n\00d\00e\00x\00 \00e\00x\00c\00e\00e\00d\00s\00 \00M\00A\00X\00_\00L\00E\00N\00G\00T\00H\00 \00(\00p\00a\00c\00k\00e\00d\00 \00a\00r\00r\00a\00y\00)")
 (data $206 (i32.const 17804) "l")
 (data $206.1 (i32.const 17816) "\02\00\00\00R\00\00\00d\00e\00l\00e\00t\00e\00L\00a\00s\00t\00:\00 \00a\00r\00r\00a\00y\00 \00i\00s\00 \00e\00m\00p\00t\00y\00 \00(\00p\00a\00c\00k\00e\00d\00 \00a\00r\00r\00a\00y\00)")
 (data $207 (i32.const 17916) "\\")
 (data $207.1 (i32.const 17928) "\02\00\00\00>\00\00\00S\00a\00f\00e\00M\00a\00t\00h\00:\00 \00s\00u\00b\00t\00r\00a\00c\00t\00i\00o\00n\00 \00u\00n\00d\00e\00r\00f\00l\00o\00w")
 (data $208 (i32.const 18012) ",")
 (data $208.1 (i32.const 18024) "\02\00\00\00\16\00\00\00T\00r\00a\00n\00s\00f\00e\00r\00r\00e\00d")
 (data $209 (i32.const 18060) "\\")
 (data $209.1 (i32.const 18072) "\02\00\00\00@\00\00\00D\00e\00s\00t\00i\00n\00a\00t\00i\00o\00n\00 \00c\00o\00n\00t\00r\00a\00c\00t\00 \00i\00s\00 \00r\00e\00q\00u\00i\00r\00e\00d")
 (data $210 (i32.const 18156) "L")
 (data $210.1 (i32.const 18168) "\02\00\00\00<\00\00\00T\00r\00a\00n\00s\00f\00e\00r\00 \00r\00e\00j\00e\00c\00t\00e\00d\00 \00b\00y\00 \00r\00e\00c\00i\00p\00i\00e\00n\00t")
 (data $211 (i32.const 18236) "L")
 (data $211.1 (i32.const 18248) "\02\00\00\006\00\00\00C\00a\00n\00n\00o\00t\00 \00a\00p\00p\00r\00o\00v\00e\00 \00z\00e\00r\00o\00 \00a\00d\00d\00r\00e\00s\00s")
 (data $212 (i32.const 18316) "L")
 (data $212.1 (i32.const 18328) "\02\00\00\002\00\00\00A\00p\00p\00r\00o\00v\00a\00l\00 \00t\00o\00 \00c\00u\00r\00r\00e\00n\00t\00 \00o\00w\00n\00e\00r")
 (data $213 (i32.const 18396) "L")
 (data $213.1 (i32.const 18408) "\02\00\00\002\00\00\00N\00o\00t\00 \00a\00u\00t\00h\00o\00r\00i\00z\00e\00d\00 \00t\00o\00 \00a\00p\00p\00r\00o\00v\00e")
 (data $214 (i32.const 18476) ",")
 (data $214.1 (i32.const 18488) "\02\00\00\00\10\00\00\00A\00p\00p\00r\00o\00v\00e\00d")
 (data $215 (i32.const 18524) "<")
 (data $215.1 (i32.const 18536) "\02\00\00\00&\00\00\00C\00a\00n\00n\00o\00t\00 \00a\00p\00p\00r\00o\00v\00e\00 \00s\00e\00l\00f")
 (data $216 (i32.const 18588) "<")
 (data $216.1 (i32.const 18600) "\02\00\00\00 \00\00\00i\00n\00v\00a\00l\00i\00d\00 \00d\00o\00w\00n\00c\00a\00s\00t")
 (data $217 (i32.const 18652) "\8c")
 (data $217.1 (i32.const 18664) "\02\00\00\00n\00\00\00~\00l\00i\00b\00/\00@\00b\00t\00c\00-\00v\00i\00s\00i\00o\00n\00/\00b\00t\00c\00-\00r\00u\00n\00t\00i\00m\00e\00/\00r\00u\00n\00t\00i\00m\00e\00/\00m\00e\00m\00o\00r\00y\00/\00M\00a\00p\00O\00f\00M\00a\00p\00.\00t\00s")
 (data $218 (i32.const 18796) ",")
 (data $218.1 (i32.const 18808) "\02\00\00\00\1c\00\00\00A\00p\00p\00r\00o\00v\00e\00d\00F\00o\00r\00A\00l\00l")
 (data $219 (i32.const 18844) "<")
 (data $219.1 (i32.const 18856) "\02\00\00\00\1e\00\00\00N\00o\00t\00 \00t\00o\00k\00e\00n\00 \00o\00w\00n\00e\00r")
 (data $220 (i32.const 18908) "L")
 (data $220.1 (i32.const 18920) "\02\00\00\000\00\00\00I\00n\00v\00a\00l\00i\00d\00 \00s\00i\00g\00n\00a\00t\00u\00r\00e\00 \00l\00e\00n\00g\00t\00h")
 (data $221 (i32.const 18988) "<")
 (data $221.1 (i32.const 19000) "\02\00\00\00\"\00\00\00B\00l\00o\00c\00k\00 \00i\00s\00 \00r\00e\00q\00u\00i\00r\00e\00d")
 (data $222 (i32.const 19052) "<")
 (data $222.1 (i32.const 19064) "\02\00\00\00\"\00\00\00S\00i\00g\00n\00a\00t\00u\00r\00e\00 \00e\00x\00p\00i\00r\00e\00d")
 (data $223 (i32.const 19116) "L")
 (data $223.1 (i32.const 19128) "\02\00\00\00.\00\00\00P\00r\00o\00t\00o\00c\00o\00l\00 \00i\00d\00 \00i\00s\00 \00r\00e\00q\00u\00i\00r\00e\00d")
 (data $224 (i32.const 19196) "L")
 (data $224.1 (i32.const 19208) "\02\00\00\008\00\00\00C\00o\00n\00t\00r\00a\00c\00t\00 \00a\00d\00d\00r\00e\00s\00s\00 \00i\00s\00 \00r\00e\00q\00u\00i\00r\00e\00d")
 (data $225 (i32.const 19276) "L")
 (data $225.1 (i32.const 19288) "\02\00\00\002\00\00\00I\00n\00v\00a\00l\00i\00d\00 \00s\00i\00g\00n\00a\00t\00u\00r\00e\00 \00l\00e\00n\00g\00t\00h\00.")
 (data $226 (i32.const 19356) "<")
 (data $226.1 (i32.const 19368) "\02\00\00\00(\00\00\00I\00n\00v\00a\00l\00i\00d\00 \00h\00a\00s\00h\00 \00l\00e\00n\00g\00t\00h\00.")
 (data $227 (i32.const 19420) "\0c\01")
 (data $227.1 (i32.const 19432) "\02\00\00\00\fc\00\00\00E\00C\00D\00S\00A\00 \00v\00e\00r\00i\00f\00i\00c\00a\00t\00i\00o\00n\00 \00i\00s\00 \00n\00o\00t\00 \00s\00u\00p\00p\00o\00r\00t\00e\00d\00 \00b\00y\00 \00v\00e\00r\00i\00f\00y\00S\00i\00g\00n\00a\00t\00u\00r\00e\00(\00)\00.\00 \00U\00s\00e\00 \00v\00e\00r\00i\00f\00y\00E\00C\00D\00S\00A\00S\00i\00g\00n\00a\00t\00u\00r\00e\00(\00)\00 \00o\00r\00 \00v\00e\00r\00i\00f\00y\00B\00i\00t\00c\00o\00i\00n\00E\00C\00D\00S\00A\00S\00i\00g\00n\00a\00t\00u\00r\00e\00(\00)\00 \00i\00n\00s\00t\00e\00a\00d\00.")
 (data $228 (i32.const 19692) "L")
 (data $228.1 (i32.const 19704) "\02\00\00\00:\00\00\00I\00n\00v\00a\00l\00i\00d\00 \00M\00L\00-\00D\00S\00A\00 \00s\00e\00c\00u\00r\00i\00t\00y\00 \00l\00e\00v\00e\00l")
 (data $229 (i32.const 19772) "\9c")
 (data $229.1 (i32.const 19784) "\02\00\00\00\86\00\00\00~\00l\00i\00b\00/\00@\00b\00t\00c\00-\00v\00i\00s\00i\00o\00n\00/\00b\00t\00c\00-\00r\00u\00n\00t\00i\00m\00e\00/\00r\00u\00n\00t\00i\00m\00e\00/\00e\00n\00v\00/\00c\00o\00n\00s\00e\00n\00s\00u\00s\00/\00M\00L\00D\00S\00A\00M\00e\00t\00a\00d\00a\00t\00a\00.\00t\00s")
 (data $230 (i32.const 19932) "L")
 (data $230.1 (i32.const 19944) "\02\00\00\006\00\00\00M\00L\00-\00D\00S\00A\00 \00p\00u\00b\00l\00i\00c\00 \00k\00e\00y\00 \00n\00o\00t\00 \00f\00o\00u\00n\00d")
 (data $231 (i32.const 20012) "|")
 (data $231.1 (i32.const 20024) "\02\00\00\00d\00\00\00~\00l\00i\00b\00/\00@\00b\00t\00c\00-\00v\00i\00s\00i\00o\00n\00/\00b\00t\00c\00-\00r\00u\00n\00t\00i\00m\00e\00/\00r\00u\00n\00t\00i\00m\00e\00/\00e\00n\00v\00/\00g\00l\00o\00b\00a\00l\00.\00t\00s")
 (data $232 (i32.const 20140) "\\")
 (data $232.1 (i32.const 20152) "\02\00\00\00B\00\00\00I\00n\00v\00a\00l\00i\00d\00 \00M\00L\00-\00D\00S\00A\00 \00p\00u\00b\00l\00i\00c\00 \00k\00e\00y\00 \00l\00e\00n\00g\00t\00h\00.")
 (data $233 (i32.const 20236) "\\")
 (data $233.1 (i32.const 20248) "\02\00\00\00@\00\00\00I\00n\00v\00a\00l\00i\00d\00 \00M\00L\00-\00D\00S\00A\00 \00s\00i\00g\00n\00a\00t\00u\00r\00e\00 \00l\00e\00n\00g\00t\00h\00.")
 (data $234 (i32.const 20332) "\bc")
 (data $234.1 (i32.const 20344) "\02\00\00\00\aa\00\00\00I\00n\00v\00a\00l\00i\00d\00 \00s\00i\00g\00n\00a\00t\00u\00r\00e\00 \00t\00y\00p\00e\00 \00o\00r\00 \00s\00i\00g\00n\00a\00t\00u\00r\00e\00s\00 \00s\00c\00h\00e\00m\00a\00 \00n\00o\00t\00 \00a\00l\00l\00o\00w\00e\00d\00 \00u\00n\00d\00e\00r\00 \00c\00u\00r\00r\00e\00n\00t\00 \00c\00o\00n\00s\00e\00n\00s\00u\00s\00 \00r\00u\00l\00e\00s")
 (data $235 (i32.const 20524) "<")
 (data $235.1 (i32.const 20536) "\02\00\00\00\"\00\00\00I\00n\00v\00a\00l\00i\00d\00 \00s\00i\00g\00n\00a\00t\00u\00r\00e")
 (data $236 (i32.const 20588) "<")
 (data $236.1 (i32.const 20600) "\02\00\00\00,\00\00\00N\00o\00t\00 \00a\00u\00t\00h\00o\00r\00i\00z\00e\00d\00 \00t\00o\00 \00b\00u\00r\00n")
 (data $237 (i32.const 20652) "\1c")
 (data $237.1 (i32.const 20664) "\02\00\00\00\0c\00\00\00B\00u\00r\00n\00e\00d")
 (data $238 (i32.const 20684) "<")
 (data $238.1 (i32.const 20696) "\02\00\00\00&\00\00\00I\00n\00d\00e\00x\00 \00o\00u\00t\00 \00o\00f\00 \00b\00o\00u\00n\00d\00s")
 (data $239 (i32.const 20748) "L")
 (data $239.1 (i32.const 20760) "\02\00\00\000\00\00\00B\00a\00s\00e\00 \00U\00R\00I\00 \00c\00a\00n\00n\00o\00t\00 \00b\00e\00 \00e\00m\00p\00t\00y")
 (data $240 (i32.const 20828) "\\")
 (data $240.1 (i32.const 20840) "\02\00\00\00>\00\00\00B\00a\00s\00e\00 \00U\00R\00I\00 \00e\00x\00c\00e\00e\00d\00s\00 \00m\00a\00x\00i\00m\00u\00m\00 \00l\00e\00n\00g\00t\00h")
 (data $241 (i32.const 20924) "\\")
 (data $241.1 (i32.const 20936) "\02\00\00\00@\00\00\00R\00e\00e\00n\00t\00r\00a\00n\00c\00y\00G\00u\00a\00r\00d\00:\00 \00D\00e\00p\00t\00h\00 \00u\00n\00d\00e\00r\00f\00l\00o\00w")
 (data $242 (i32.const 21020) ",")
 (data $242.1 (i32.const 21032) "\02\00\00\00\12\00\00\00D\00o\00p\00a\00m\00i\00l\00i\00o")
 (data $243 (i32.const 21068) ",")
 (data $243.1 (i32.const 21080) "\02\00\00\00\10\00\00\00D\00O\00P\00A\00M\00I\00N\00E")
 (data $244 (i32.const 21116) "<")
 (data $244.1 (i32.const 21128) "\02\00\00\00&\00\00\00A\00l\00r\00e\00a\00d\00y\00 \00i\00n\00i\00t\00i\00a\00l\00i\00z\00e\00d")
 (data $245 (i32.const 21180) "<")
 (data $245.1 (i32.const 21192) "\02\00\00\00(\00\00\00N\00a\00m\00e\00 \00c\00a\00n\00n\00o\00t\00 \00b\00e\00 \00e\00m\00p\00t\00y")
 (data $246 (i32.const 21244) "<")
 (data $246.1 (i32.const 21256) "\02\00\00\00,\00\00\00S\00y\00m\00b\00o\00l\00 \00c\00a\00n\00n\00o\00t\00 \00b\00e\00 \00e\00m\00p\00t\00y")
 (data $247 (i32.const 21308) "L")
 (data $247.1 (i32.const 21320) "\02\00\00\002\00\00\00M\00a\00x\00 \00s\00u\00p\00p\00l\00y\00 \00c\00a\00n\00n\00o\00t\00 \00b\00e\00 \00z\00e\00r\00o")
 (data $248 (i32.const 21388) ",")
 (data $248.1 (i32.const 21400) "\02\00\00\00\18\00\00\00S\00t\00o\00r\00e\00d\00S\00t\00r\00i\00n\00g")
 (table $0 2 2 funcref)
 (elem $0 (i32.const 1) $start:op721/index~anonymous|0)
 (export "abort" (func $op721/index/abort))
 (export "execute" (func $~lib/@btc-vision/btc-runtime/runtime/exports/index/execute))
 (export "onDeploy" (func $~lib/@btc-vision/btc-runtime/runtime/exports/index/onDeploy))
 (export "onUpdate" (func $~lib/@btc-vision/btc-runtime/runtime/exports/index/onUpdate))
 (export "memory" (memory $0))
 (export "start" (func $~start))
 (func $~lib/util/number/decimalCount32 (param $0 i32) (result i32)
  local.get $0
  i32.const 10
  i32.ge_u
  i32.const 1
  i32.add
  local.get $0
  i32.const 10000
  i32.ge_u
  i32.const 3
  i32.add
  local.get $0
  i32.const 1000
  i32.ge_u
  i32.add
  local.get $0
  i32.const 100
  i32.lt_u
  select
  local.get $0
  i32.const 1000000
  i32.ge_u
  i32.const 6
  i32.add
  local.get $0
  i32.const 1000000000
  i32.ge_u
  i32.const 8
  i32.add
  local.get $0
  i32.const 100000000
  i32.ge_u
  i32.add
  local.get $0
  i32.const 10000000
  i32.lt_u
  select
  local.get $0
  i32.const 100000
  i32.lt_u
  select
 )
 (func $~lib/util/number/utoa_dec_simple<u32> (param $0 i32) (param $1 i32) (param $2 i32)
  loop $do-loop|0
   local.get $0
   local.get $2
   i32.const 1
   i32.sub
   local.tee $2
   i32.const 1
   i32.shl
   i32.add
   local.get $1
   i32.const 10
   i32.rem_u
   i32.const 48
   i32.add
   i32.store16
   local.get $1
   i32.const 10
   i32.div_u
   local.tee $1
   br_if $do-loop|0
  end
 )
 (func $~lib/number/U32#toString (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  local.get $0
  if (result i32)
   local.get $0
   call $~lib/util/number/decimalCount32
   local.tee $1
   i32.const 1
   i32.shl
   i32.const 2
   call $~lib/rt/stub/__new
   local.tee $2
   local.get $0
   local.get $1
   call $~lib/util/number/utoa_dec_simple<u32>
   local.get $2
  else
   i32.const 1904
  end
 )
 (func $~lib/staticarray/StaticArray<~lib/string/String>#__uset (param $0 i32) (param $1 i32) (param $2 i32)
  local.get $0
  local.get $1
  i32.const 2
  i32.shl
  i32.add
  local.get $2
  i32.store
 )
 (func $~lib/string/String#get:length (param $0 i32) (result i32)
  local.get $0
  i32.const 20
  i32.sub
  i32.load offset=16
  i32.const 1
  i32.shr_u
 )
 (func $~lib/string/String.__eq (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  local.get $0
  local.get $1
  i32.eq
  if
   i32.const 1
   return
  end
  local.get $1
  i32.eqz
  local.get $0
  i32.eqz
  i32.or
  if
   i32.const 0
   return
  end
  local.get $0
  call $~lib/string/String#get:length
  local.set $2
  local.get $1
  call $~lib/string/String#get:length
  local.get $2
  i32.ne
  if
   i32.const 0
   return
  end
  block $__inlined_func$~lib/util/string/compareImpl$4
   loop $while-continue|0
    local.get $2
    local.tee $3
    i32.const 1
    i32.sub
    local.set $2
    local.get $3
    if
     local.get $0
     i32.load16_u
     local.tee $5
     local.get $1
     i32.load16_u
     local.tee $3
     i32.sub
     local.set $4
     local.get $3
     local.get $5
     i32.ne
     br_if $__inlined_func$~lib/util/string/compareImpl$4
     local.get $0
     i32.const 2
     i32.add
     local.set $0
     local.get $1
     i32.const 2
     i32.add
     local.set $1
     br $while-continue|0
    end
   end
   i32.const 0
   local.set $4
  end
  local.get $4
  i32.eqz
 )
 (func $~lib/string/String.__ne (param $0 i32) (result i32)
  local.get $0
  i32.const 0
  call $~lib/string/String.__eq
  i32.eqz
 )
 (func $~lib/string/String#concat (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  local.get $0
  call $~lib/string/String#get:length
  i32.const 1
  i32.shl
  local.tee $2
  local.get $1
  call $~lib/string/String#get:length
  i32.const 1
  i32.shl
  local.tee $3
  i32.add
  local.tee $4
  i32.eqz
  if
   i32.const 2032
   return
  end
  local.get $4
  i32.const 2
  call $~lib/rt/stub/__new
  local.tee $4
  local.get $0
  local.get $2
  memory.copy
  local.get $2
  local.get $4
  i32.add
  local.get $1
  local.get $3
  memory.copy
  local.get $4
 )
 (func $~lib/staticarray/StaticArray<~lib/string/String>#join (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  block $__inlined_func$~lib/util/string/joinReferenceArray<~lib/string/String> (result i32)
   i32.const 2032
   local.get $0
   local.tee $1
   i32.const 20
   i32.sub
   i32.load offset=16
   i32.const 2
   i32.shr_u
   i32.const 1
   i32.sub
   local.tee $3
   i32.const 0
   i32.lt_s
   br_if $__inlined_func$~lib/util/string/joinReferenceArray<~lib/string/String>
   drop
   local.get $3
   i32.eqz
   if
    local.get $1
    i32.load
    local.tee $0
    call $~lib/string/String.__ne
    if (result i32)
     local.get $0
    else
     i32.const 2032
    end
    br $__inlined_func$~lib/util/string/joinReferenceArray<~lib/string/String>
   end
   i32.const 2032
   local.set $0
   i32.const 2032
   call $~lib/string/String#get:length
   local.set $4
   loop $for-loop|0
    local.get $2
    local.get $3
    i32.lt_s
    if
     local.get $1
     local.get $2
     i32.const 2
     i32.shl
     i32.add
     i32.load
     local.tee $5
     call $~lib/string/String.__ne
     if
      local.get $0
      local.get $5
      call $~lib/string/String#concat
      local.set $0
     end
     local.get $4
     if
      local.get $0
      i32.const 2032
      call $~lib/string/String#concat
      local.set $0
     end
     local.get $2
     i32.const 1
     i32.add
     local.set $2
     br $for-loop|0
    end
   end
   local.get $1
   local.get $3
   i32.const 2
   i32.shl
   i32.add
   i32.load
   local.tee $1
   call $~lib/string/String.__ne
   if (result i32)
    local.get $0
    local.get $1
    call $~lib/string/String#concat
   else
    local.get $0
   end
  end
 )
 (func $~lib/string/String.UTF8.byteLength (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  local.get $0
  local.get $0
  i32.const 20
  i32.sub
  i32.load offset=16
  i32.add
  local.set $2
  loop $while-continue|0
   local.get $0
   local.get $2
   i32.lt_u
   if
    local.get $0
    i32.load16_u
    local.tee $3
    i32.const 128
    i32.lt_u
    if (result i32)
     local.get $1
     i32.const 1
     i32.add
    else
     local.get $3
     i32.const 2048
     i32.lt_u
     if (result i32)
      local.get $1
      i32.const 2
      i32.add
     else
      local.get $3
      i32.const 64512
      i32.and
      i32.const 55296
      i32.eq
      local.get $0
      i32.const 2
      i32.add
      local.get $2
      i32.lt_u
      i32.and
      if
       local.get $0
       i32.load16_u offset=2
       i32.const 64512
       i32.and
       i32.const 56320
       i32.eq
       if
        local.get $1
        i32.const 4
        i32.add
        local.set $1
        local.get $0
        i32.const 4
        i32.add
        local.set $0
        br $while-continue|0
       end
      end
      local.get $1
      i32.const 3
      i32.add
     end
    end
    local.set $1
    local.get $0
    i32.const 2
    i32.add
    local.set $0
    br $while-continue|0
   end
  end
  local.get $1
 )
 (func $~lib/string/String.UTF8.encodeUnsafe (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  local.get $0
  local.get $1
  i32.const 1
  i32.shl
  i32.add
  local.set $3
  local.get $2
  local.set $1
  loop $while-continue|0
   local.get $0
   local.get $3
   i32.lt_u
   if
    local.get $0
    i32.load16_u
    local.tee $2
    i32.const 128
    i32.lt_u
    if (result i32)
     local.get $1
     local.get $2
     i32.store8
     local.get $1
     i32.const 1
     i32.add
    else
     local.get $2
     i32.const 2048
     i32.lt_u
     if (result i32)
      local.get $1
      local.get $2
      i32.const 6
      i32.shr_u
      i32.const 192
      i32.or
      local.get $2
      i32.const 63
      i32.and
      i32.const 128
      i32.or
      i32.const 8
      i32.shl
      i32.or
      i32.store16
      local.get $1
      i32.const 2
      i32.add
     else
      local.get $2
      i32.const 56320
      i32.lt_u
      local.get $0
      i32.const 2
      i32.add
      local.get $3
      i32.lt_u
      i32.and
      local.get $2
      i32.const 63488
      i32.and
      i32.const 55296
      i32.eq
      i32.and
      if
       local.get $0
       i32.load16_u offset=2
       local.tee $4
       i32.const 64512
       i32.and
       i32.const 56320
       i32.eq
       if
        local.get $1
        local.get $2
        i32.const 1023
        i32.and
        i32.const 10
        i32.shl
        i32.const 65536
        i32.add
        local.get $4
        i32.const 1023
        i32.and
        i32.or
        local.tee $2
        i32.const 63
        i32.and
        i32.const 128
        i32.or
        i32.const 24
        i32.shl
        local.get $2
        i32.const 6
        i32.shr_u
        i32.const 63
        i32.and
        i32.const 128
        i32.or
        i32.const 16
        i32.shl
        i32.or
        local.get $2
        i32.const 12
        i32.shr_u
        i32.const 63
        i32.and
        i32.const 128
        i32.or
        i32.const 8
        i32.shl
        i32.or
        local.get $2
        i32.const 18
        i32.shr_u
        i32.const 240
        i32.or
        i32.or
        i32.store
        local.get $1
        i32.const 4
        i32.add
        local.set $1
        local.get $0
        i32.const 4
        i32.add
        local.set $0
        br $while-continue|0
       end
      end
      local.get $1
      local.get $2
      i32.const 12
      i32.shr_u
      i32.const 224
      i32.or
      local.get $2
      i32.const 6
      i32.shr_u
      i32.const 63
      i32.and
      i32.const 128
      i32.or
      i32.const 8
      i32.shl
      i32.or
      i32.store16
      local.get $1
      local.get $2
      i32.const 63
      i32.and
      i32.const 128
      i32.or
      i32.store8 offset=2
      local.get $1
      i32.const 3
      i32.add
     end
    end
    local.set $1
    local.get $0
    i32.const 2
    i32.add
    local.set $0
    br $while-continue|0
   end
  end
 )
 (func $~lib/string/String.UTF8.encode@varargs (param $0 i32) (result i32)
  (local $1 i32)
  block $2of2
   block $outOfRange
    global.get $~argumentsLength
    i32.const 1
    i32.sub
    br_table $2of2 $2of2 $2of2 $outOfRange
   end
   unreachable
  end
  local.get $0
  call $~lib/string/String.UTF8.byteLength
  i32.const 1
  call $~lib/rt/stub/__new
  local.set $1
  local.get $0
  local.get $0
  call $~lib/string/String#get:length
  local.get $1
  call $~lib/string/String.UTF8.encodeUnsafe
  local.get $1
 )
 (func $~lib/arraybuffer/ArrayBuffer#get:byteLength (param $0 i32) (result i32)
  local.get $0
  i32.const 20
  i32.sub
  i32.load offset=16
 )
 (func $~lib/typedarray/Uint8Array.wrap@varargs (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  block $2of2
   block $1of2
    block $outOfRange
     global.get $~argumentsLength
     i32.const 1
     i32.sub
     br_table $1of2 $1of2 $2of2 $outOfRange
    end
    unreachable
   end
   i32.const -1
   local.set $2
  end
  local.get $0
  call $~lib/arraybuffer/ArrayBuffer#get:byteLength
  local.set $1
  local.get $2
  i32.const 0
  i32.lt_s
  if
   local.get $2
   i32.const -1
   i32.ne
   if
    i32.const 2304
    i32.const 2240
    i32.const 1876
    i32.const 7
    call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
    unreachable
   end
   local.get $1
   local.set $2
  else
   local.get $1
   local.get $2
   i32.lt_s
   if
    i32.const 2304
    i32.const 2240
    i32.const 1881
    i32.const 7
    call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
    unreachable
   end
  end
  i32.const 12
  i32.const 7
  call $~lib/rt/stub/__new
  local.tee $1
  local.get $0
  i32.store
  local.get $1
  local.get $2
  i32.store offset=8
  local.get $1
  local.get $0
  i32.store offset=4
  local.get $1
 )
 (func $~lib/arraybuffer/ArrayBuffer#constructor (param $0 i32) (result i32)
  (local $1 i32)
  local.get $0
  i32.const 1073741820
  i32.gt_u
  if
   i32.const 2304
   i32.const 2352
   i32.const 52
   i32.const 43
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $0
  i32.const 1
  call $~lib/rt/stub/__new
  local.tee $1
  i32.const 0
  local.get $0
  memory.fill
  local.get $1
 )
 (func $~lib/dataview/DataView#constructor@varargs (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  block $2of2
   block $1of2
    block $outOfRange
     global.get $~argumentsLength
     i32.const 1
     i32.sub
     br_table $1of2 $1of2 $2of2 $outOfRange
    end
    unreachable
   end
   local.get $0
   call $~lib/arraybuffer/ArrayBuffer#get:byteLength
   local.set $2
  end
  i32.const 12
  i32.const 8
  call $~lib/rt/stub/__new
  local.tee $1
  i32.const 0
  i32.store
  local.get $1
  i32.const 0
  i32.store offset=4
  local.get $1
  i32.const 0
  i32.store offset=8
  local.get $0
  call $~lib/arraybuffer/ArrayBuffer#get:byteLength
  local.get $2
  i32.lt_u
  local.get $2
  i32.const 1073741820
  i32.gt_u
  i32.or
  if
   i32.const 2304
   i32.const 2416
   i32.const 25
   i32.const 7
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $1
  local.get $0
  i32.store
  local.get $1
  local.get $0
  i32.store offset=4
  local.get $1
  local.get $2
  i32.store offset=8
  local.get $1
 )
 (func $~lib/polyfills/bswap<u32> (param $0 i32) (result i32)
  local.get $0
  i32.const -16711936
  i32.and
  i32.const 8
  i32.rotl
  local.get $0
  i32.const 16711935
  i32.and
  i32.const 8
  i32.rotr
  i32.or
 )
 (func $~lib/dataview/DataView#setUint32 (param $0 i32) (param $1 i32) (param $2 i32)
  local.get $1
  i32.const 31
  i32.shr_u
  local.get $0
  i32.load offset=8
  local.get $1
  i32.const 4
  i32.add
  i32.lt_s
  i32.or
  if
   i32.const 2176
   i32.const 2416
   i32.const 142
   i32.const 7
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $0
  i32.load offset=4
  local.get $1
  i32.add
  local.get $2
  call $~lib/polyfills/bswap<u32>
  i32.store
 )
 (func $~lib/typedarray/Uint8Array#__get (param $0 i32) (param $1 i32) (result i32)
  local.get $1
  local.get $0
  i32.load offset=8
  i32.ge_u
  if
   i32.const 2176
   i32.const 2240
   i32.const 168
   i32.const 45
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $0
  i32.load offset=4
  local.get $1
  i32.add
  i32.load8_u
 )
 (func $~lib/dataview/DataView#setUint8 (param $0 i32) (param $1 i32) (param $2 i32)
  local.get $1
  local.get $0
  i32.load offset=8
  i32.ge_u
  if
   i32.const 2176
   i32.const 2416
   i32.const 128
   i32.const 50
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $0
  i32.load offset=4
  local.get $1
  i32.add
  local.get $2
  i32.store8
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  (local $4 i32)
  local.get $2
  call $~lib/number/U32#toString
  local.set $2
  local.get $3
  call $~lib/number/U32#toString
  local.set $3
  i32.const 1120
  i32.const 0
  local.get $0
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  i32.const 1120
  i32.const 2
  local.get $1
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  i32.const 1120
  i32.const 4
  local.get $2
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  i32.const 1120
  i32.const 6
  local.get $3
  call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
  i32.const 1120
  call $~lib/staticarray/StaticArray<~lib/string/String>#join
  i32.const 1
  global.set $~argumentsLength
  call $~lib/string/String.UTF8.encode@varargs
  i32.const 1
  global.set $~argumentsLength
  call $~lib/typedarray/Uint8Array.wrap@varargs
  local.tee $0
  i32.load offset=8
  i32.const 8
  i32.add
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.set $1
  i32.const 1
  global.set $~argumentsLength
  local.get $1
  call $~lib/dataview/DataView#constructor@varargs
  local.tee $2
  i32.const 0
  i32.const 1668521308
  call $~lib/dataview/DataView#setUint32
  local.get $2
  i32.const 4
  local.get $0
  i32.load offset=8
  call $~lib/dataview/DataView#setUint32
  loop $for-loop|0
   local.get $4
   local.get $0
   i32.load offset=8
   i32.lt_s
   if
    local.get $2
    local.get $4
    i32.const 8
    i32.add
    local.get $0
    local.get $4
    call $~lib/typedarray/Uint8Array#__get
    call $~lib/dataview/DataView#setUint8
    local.get $4
    i32.const 1
    i32.add
    local.set $4
    br $for-loop|0
   end
  end
  i32.const 1
  local.get $1
  local.get $1
  call $~lib/arraybuffer/ArrayBuffer#get:byteLength
  call $~lib/@btc-vision/btc-runtime/runtime/env/global/env_exit
 )
 (func $op721/index/abort (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  local.get $0
  local.get $1
  local.get $2
  local.get $3
  call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
 )
 (func $~lib/rt/stub/maybeGrowMemory (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  memory.size
  local.tee $1
  i32.const 16
  i32.shl
  i32.const 15
  i32.add
  i32.const -16
  i32.and
  local.tee $2
  local.get $0
  i32.lt_u
  if
   local.get $1
   local.get $0
   local.get $2
   i32.sub
   i32.const 65535
   i32.add
   i32.const -65536
   i32.and
   i32.const 16
   i32.shr_u
   local.tee $2
   local.get $1
   local.get $2
   i32.gt_s
   select
   memory.grow
   i32.const 0
   i32.lt_s
   if
    local.get $2
    memory.grow
    i32.const 0
    i32.lt_s
    if
     unreachable
    end
   end
  end
  local.get $0
  global.set $~lib/rt/stub/offset
 )
 (func $~lib/rt/stub/__alloc (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  local.get $0
  i32.const 1073741820
  i32.gt_u
  if
   i32.const 2480
   i32.const 2544
   i32.const 33
   i32.const 29
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  global.get $~lib/rt/stub/offset
  global.get $~lib/rt/stub/offset
  i32.const 4
  i32.add
  local.tee $2
  local.get $0
  i32.const 19
  i32.add
  i32.const -16
  i32.and
  i32.const 4
  i32.sub
  local.tee $0
  i32.add
  call $~lib/rt/stub/maybeGrowMemory
  local.get $0
  i32.store
  local.get $2
 )
 (func $~lib/rt/stub/__new (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  local.get $0
  i32.const 1073741804
  i32.gt_u
  if
   i32.const 2480
   i32.const 2544
   i32.const 86
   i32.const 30
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $0
  i32.const 16
  i32.add
  call $~lib/rt/stub/__alloc
  local.tee $3
  i32.const 4
  i32.sub
  local.tee $2
  i32.const 0
  i32.store offset=4
  local.get $2
  i32.const 0
  i32.store offset=8
  local.get $2
  local.get $1
  i32.store offset=12
  local.get $2
  local.get $0
  i32.store offset=16
  local.get $3
  i32.const 16
  i32.add
 )
 (func $~lib/@btc-vision/as-bignum/assembly/integer/u128/u128#constructor (param $0 i64) (param $1 i64) (result i32)
  (local $2 i32)
  i32.const 16
  i32.const 4
  call $~lib/rt/stub/__new
  local.tee $2
  local.get $0
  i64.store
  local.get $2
  local.get $1
  i64.store offset=8
  local.get $2
 )
 (func $~lib/typedarray/Uint8Array#constructor (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $0
  i32.eqz
  if
   i32.const 12
   i32.const 7
   call $~lib/rt/stub/__new
   local.set $0
  end
  local.get $0
  i32.eqz
  if
   i32.const 12
   i32.const 3
   call $~lib/rt/stub/__new
   local.set $0
  end
  local.get $0
  i32.const 0
  i32.store
  local.get $0
  i32.const 0
  i32.store offset=4
  local.get $0
  i32.const 0
  i32.store offset=8
  local.get $1
  i32.const 1073741820
  i32.gt_u
  if
   i32.const 2304
   i32.const 2352
   i32.const 19
   i32.const 57
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $1
  i32.const 1
  call $~lib/rt/stub/__new
  local.tee $2
  i32.const 0
  local.get $1
  memory.fill
  local.get $0
  local.get $2
  i32.store
  local.get $0
  local.get $2
  i32.store offset=4
  local.get $0
  local.get $1
  i32.store offset=8
  local.get $0
 )
 (func $~lib/number/I32#toString (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  local.get $0
  if (result i32)
   i32.const 0
   local.get $0
   i32.sub
   local.get $0
   local.get $0
   i32.const 31
   i32.shr_u
   i32.const 1
   i32.shl
   local.tee $3
   select
   local.tee $2
   call $~lib/util/number/decimalCount32
   local.tee $0
   i32.const 1
   i32.shl
   local.get $3
   i32.add
   i32.const 2
   call $~lib/rt/stub/__new
   local.tee $1
   local.get $3
   i32.add
   local.get $2
   local.get $0
   call $~lib/util/number/utoa_dec_simple<u32>
   local.get $3
   if
    local.get $1
    i32.const 45
    i32.store16
   end
   local.get $1
  else
   i32.const 1904
  end
 )
 (func $~lib/typedarray/Uint8Array#set<~lib/array/Array<u8>> (param $0 i32) (param $1 i32)
  (local $2 i32)
  local.get $1
  i32.load offset=12
  local.tee $2
  local.get $0
  i32.load offset=8
  i32.gt_s
  if
   i32.const 2176
   i32.const 2240
   i32.const 1911
   i32.const 5
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $0
  i32.load offset=4
  local.get $1
  i32.load offset=4
  local.get $2
  memory.copy
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/types/Address/Address#constructor (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  i32.eqz
  if
   i32.const 20
   i32.const 9
   call $~lib/rt/stub/__new
   local.set $0
  end
  local.get $0
  i32.const 0
  i32.store8 offset=12
  local.get $0
  i32.const 0
  i32.store offset=16
  local.get $0
  i32.const 32
  call $~lib/typedarray/Uint8Array#constructor
  local.set $0
  local.get $1
  if (result i32)
   local.get $1
   i32.load offset=12
  else
   i32.const 0
  end
  if
   local.get $1
   i32.load offset=12
   i32.const 32
   i32.ne
   if
    i32.const 2720
    i32.const 1
    local.get $1
    i32.load offset=12
    call $~lib/number/I32#toString
    call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
    i32.const 2720
    call $~lib/staticarray/StaticArray<~lib/string/String>#join
    i32.const 2752
    i32.const 335
    i32.const 13
    call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
    unreachable
   end
   local.get $0
   local.get $1
   call $~lib/typedarray/Uint8Array#set<~lib/array/Array<u8>>
   local.get $0
   i32.const 1
   i32.store8 offset=12
  end
  local.get $0
 )
 (func $~lib/rt/__newArray (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (result i32)
  (local $4 i32)
  local.get $0
  local.get $1
  i32.shl
  local.tee $4
  i32.const 1
  call $~lib/rt/stub/__new
  local.set $1
  local.get $3
  if
   local.get $1
   local.get $3
   local.get $4
   memory.copy
  end
  i32.const 16
  local.get $2
  call $~lib/rt/stub/__new
  local.tee $2
  local.get $1
  i32.store
  local.get $2
  local.get $1
  i32.store offset=4
  local.get $2
  local.get $4
  i32.store offset=8
  local.get $2
  local.get $0
  i32.store offset=12
  local.get $2
 )
 (func $~lib/typedarray/Uint8Array#set<~lib/array/Array<i32>> (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  local.get $1
  i32.load offset=12
  local.tee $3
  local.get $0
  i32.load offset=8
  i32.gt_s
  if
   i32.const 2176
   i32.const 2240
   i32.const 1911
   i32.const 5
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $0
  i32.load offset=4
  local.set $0
  local.get $1
  i32.load offset=4
  local.set $1
  loop $for-loop|0
   local.get $2
   local.get $3
   i32.lt_s
   if
    local.get $0
    local.get $2
    i32.add
    local.get $1
    local.get $2
    i32.const 2
    i32.shl
    i32.add
    i32.load
    i32.store8
    local.get $2
    i32.const 1
    i32.add
    local.set $2
    br $for-loop|0
   end
  end
 )
 (func $~lib/typedarray/Uint8Array#__set (param $0 i32) (param $1 i32) (param $2 i32)
  local.get $1
  local.get $0
  i32.load offset=8
  i32.ge_u
  if
   i32.const 2176
   i32.const 2240
   i32.const 179
   i32.const 45
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $0
  i32.load offset=4
  local.get $1
  i32.add
  local.get $2
  i32.store8
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/types/ExtendedAddress/ExtendedAddress#constructor (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  i32.const 24
  i32.const 15
  call $~lib/rt/stub/__new
  local.tee $2
  i32.const 0
  i32.store offset=20
  local.get $2
  local.get $1
  call $~lib/@btc-vision/btc-runtime/runtime/types/Address/Address#constructor
  local.set $1
  local.get $0
  i32.load offset=12
  i32.const 32
  i32.ne
  if
   i32.const 3936
   i32.const 4048
   i32.const 71
   i32.const 13
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $1
  i32.const 0
  i32.const 32
  call $~lib/typedarray/Uint8Array#constructor
  i32.store offset=20
  local.get $1
  i32.load offset=20
  local.get $0
  call $~lib/typedarray/Uint8Array#set<~lib/array/Array<u8>>
  local.get $1
 )
 (func $~lib/object/Object#constructor (param $0 i32) (result i32)
  local.get $0
  if (result i32)
   local.get $0
  else
   i32.const 0
   i32.const 0
   call $~lib/rt/stub/__new
  end
 )
 (func $~lib/array/Array<u8>#constructor (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  i32.const 16
  i32.const 10
  call $~lib/rt/stub/__new
  local.tee $1
  i32.const 0
  i32.store
  local.get $1
  i32.const 0
  i32.store offset=4
  local.get $1
  i32.const 0
  i32.store offset=8
  local.get $1
  i32.const 0
  i32.store offset=12
  local.get $0
  i32.const 1073741820
  i32.gt_u
  if
   i32.const 2304
   i32.const 4192
   i32.const 72
   i32.const 60
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  i32.const 8
  local.get $0
  local.get $0
  i32.const 8
  i32.le_u
  select
  local.tee $2
  i32.const 1
  call $~lib/rt/stub/__new
  local.tee $3
  i32.const 0
  local.get $2
  memory.fill
  local.get $1
  local.get $3
  i32.store
  local.get $1
  local.get $3
  i32.store offset=4
  local.get $1
  local.get $2
  i32.store offset=8
  local.get $1
  local.get $0
  i32.store offset=12
  local.get $1
 )
 (func $~lib/rt/stub/__realloc (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  local.get $0
  i32.const 15
  i32.and
  i32.const 1
  local.get $0
  select
  if
   i32.const 0
   i32.const 2544
   i32.const 45
   i32.const 3
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  global.get $~lib/rt/stub/offset
  local.get $0
  i32.const 4
  i32.sub
  local.tee $4
  i32.load
  local.tee $3
  local.get $0
  i32.add
  i32.eq
  local.set $5
  local.get $1
  i32.const 19
  i32.add
  i32.const -16
  i32.and
  i32.const 4
  i32.sub
  local.set $2
  local.get $1
  local.get $3
  i32.gt_u
  if
   local.get $5
   if
    local.get $1
    i32.const 1073741820
    i32.gt_u
    if
     i32.const 2480
     i32.const 2544
     i32.const 52
     i32.const 33
     call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
     unreachable
    end
    local.get $0
    local.get $2
    i32.add
    call $~lib/rt/stub/maybeGrowMemory
    local.get $4
    local.get $2
    i32.store
   else
    local.get $2
    local.get $3
    i32.const 1
    i32.shl
    local.tee $1
    local.get $1
    local.get $2
    i32.lt_u
    select
    call $~lib/rt/stub/__alloc
    local.tee $1
    local.get $0
    local.get $3
    memory.copy
    local.get $1
    local.set $0
   end
  else
   local.get $5
   if
    local.get $0
    local.get $2
    i32.add
    global.set $~lib/rt/stub/offset
    local.get $4
    local.get $2
    i32.store
   end
  end
  local.get $0
 )
 (func $~lib/rt/stub/__renew (param $0 i32) (param $1 i32) (result i32)
  local.get $1
  i32.const 1073741804
  i32.gt_u
  if
   i32.const 2480
   i32.const 2544
   i32.const 99
   i32.const 30
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $0
  i32.const 16
  i32.sub
  local.get $1
  i32.const 16
  i32.add
  call $~lib/rt/stub/__realloc
  local.tee $0
  i32.const 4
  i32.sub
  local.get $1
  i32.store offset=16
  local.get $0
  i32.const 16
  i32.add
 )
 (func $~lib/array/ensureCapacity (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  (local $4 i32)
  (local $5 i32)
  local.get $1
  local.get $0
  i32.load offset=8
  local.tee $4
  local.get $2
  i32.shr_u
  i32.gt_u
  if
   local.get $1
   i32.const 1073741820
   local.get $2
   i32.shr_u
   i32.gt_u
   if
    i32.const 2304
    i32.const 4192
    i32.const 19
    i32.const 48
    call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
    unreachable
   end
   i32.const 8
   local.get $1
   local.get $1
   i32.const 8
   i32.le_u
   select
   local.get $2
   i32.shl
   local.set $1
   local.get $3
   if
    i32.const 1073741820
    local.get $4
    i32.const 1
    i32.shl
    local.tee $2
    local.get $2
    i32.const 1073741820
    i32.ge_u
    select
    local.tee $2
    local.get $1
    local.get $1
    local.get $2
    i32.lt_u
    select
    local.set $1
   end
   local.get $0
   i32.load
   local.tee $5
   local.get $1
   call $~lib/rt/stub/__renew
   local.tee $2
   local.get $4
   i32.add
   i32.const 0
   local.get $1
   local.get $4
   i32.sub
   memory.fill
   local.get $2
   local.get $5
   i32.ne
   if
    local.get $0
    local.get $2
    i32.store
    local.get $0
    local.get $2
    i32.store offset=4
   end
   local.get $0
   local.get $1
   i32.store offset=8
  end
 )
 (func $~lib/array/Array<u8>#__set (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  local.get $1
  local.get $0
  i32.load offset=12
  i32.ge_u
  if
   local.get $1
   i32.const 0
   i32.lt_s
   if
    i32.const 2176
    i32.const 4192
    i32.const 132
    i32.const 22
    call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
    unreachable
   end
   local.get $0
   local.get $1
   i32.const 1
   i32.add
   local.tee $3
   i32.const 0
   i32.const 1
   call $~lib/array/ensureCapacity
   local.get $0
   local.get $3
   i32.store offset=12
  end
  local.get $0
  i32.load offset=4
  local.get $1
  i32.add
  local.get $2
  i32.store8
 )
 (func $~lib/typedarray/Uint8Array#slice (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  local.get $0
  i32.load offset=8
  local.set $3
  local.get $1
  i32.const 0
  i32.lt_s
  if (result i32)
   local.get $1
   local.get $3
   i32.add
   local.tee $1
   i32.const 0
   local.get $1
   i32.const 0
   i32.gt_s
   select
  else
   local.get $1
   local.get $3
   local.get $1
   local.get $3
   i32.lt_s
   select
  end
  local.set $1
  i32.const 0
  local.get $2
  i32.const 0
  i32.lt_s
  if (result i32)
   local.get $2
   local.get $3
   i32.add
   local.tee $2
   i32.const 0
   local.get $2
   i32.const 0
   i32.gt_s
   select
  else
   local.get $2
   local.get $3
   local.get $2
   local.get $3
   i32.lt_s
   select
  end
  local.get $1
  i32.sub
  local.tee $2
  i32.const 0
  local.get $2
  i32.const 0
  i32.gt_s
  select
  local.tee $2
  call $~lib/typedarray/Uint8Array#constructor
  local.tee $3
  i32.load offset=4
  local.get $0
  i32.load offset=4
  local.get $1
  i32.add
  local.get $2
  memory.copy
  local.get $3
 )
 (func $~lib/typedarray/Uint8Array#slice@varargs (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  block $2of2
   block $1of2
    block $0of2
     block $outOfRange
      global.get $~argumentsLength
      br_table $0of2 $1of2 $2of2 $outOfRange
     end
     unreachable
    end
    i32.const 0
    local.set $1
   end
   i32.const 2147483647
   local.set $2
  end
  local.get $0
  local.get $1
  local.get $2
  call $~lib/typedarray/Uint8Array#slice
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/types/ExtendedAddress/ExtendedAddress#clone (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  local.get $0
  i32.load offset=20
  i32.load offset=8
  call $~lib/array/Array<u8>#constructor
  local.set $3
  loop $for-loop|0
   local.get $1
   local.get $0
   i32.load offset=20
   i32.load offset=8
   i32.lt_s
   if
    local.get $3
    local.get $1
    local.get $0
    i32.load offset=20
    local.get $1
    call $~lib/typedarray/Uint8Array#__get
    call $~lib/array/Array<u8>#__set
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|0
   end
  end
  i32.const 1
  global.set $~argumentsLength
  local.get $0
  i32.const 0
  call $~lib/typedarray/Uint8Array#slice@varargs
  local.tee $1
  i32.load offset=8
  call $~lib/array/Array<u8>#constructor
  local.set $4
  loop $for-loop|1
   local.get $2
   local.get $1
   i32.load offset=8
   i32.lt_s
   if
    local.get $4
    local.get $2
    local.get $1
    local.get $2
    call $~lib/typedarray/Uint8Array#__get
    call $~lib/array/Array<u8>#__set
    local.get $2
    i32.const 1
    i32.add
    local.set $2
    br $for-loop|1
   end
  end
  local.get $3
  local.get $4
  call $~lib/@btc-vision/btc-runtime/runtime/types/ExtendedAddress/ExtendedAddress#constructor
  local.tee $1
  local.get $0
  i32.load8_u offset=12
  i32.store8 offset=12
  local.get $1
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/generic/MapUint8Array/MapUint8Array#constructor (result i32)
  (local $0 i32)
  i32.const 12
  i32.const 17
  call $~lib/rt/stub/__new
  call $~lib/object/Object#constructor
  local.tee $0
  i32.const 0
  i32.const 2
  i32.const 19
  i32.const 4240
  call $~lib/rt/__newArray
  i32.store
  local.get $0
  i32.const 0
  i32.const 2
  i32.const 19
  i32.const 4272
  call $~lib/rt/__newArray
  i32.store offset=4
  local.get $0
  i32.const -1
  i32.store offset=8
  local.get $0
 )
 (func $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#constructor (param $0 i64) (param $1 i64) (param $2 i64) (param $3 i64) (result i32)
  (local $4 i32)
  i32.const 32
  i32.const 25
  call $~lib/rt/stub/__new
  local.tee $4
  local.get $0
  i64.store
  local.get $4
  local.get $1
  i64.store offset=8
  local.get $4
  local.get $2
  i64.store offset=16
  local.get $4
  local.get $3
  i64.store offset=24
  local.get $4
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#get:nextPointer (param $0 i32) (result i32)
  local.get $0
  i32.load16_u offset=32
  i32.const 65535
  i32.eq
  if
   i32.const 5088
   i32.const 5168
   i32.const 189
   i32.const 13
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $0
  local.get $0
  i32.load16_u offset=32
  i32.const 1
  i32.add
  i32.store16 offset=32
  local.get $0
  i32.load16_u offset=32
 )
 (func $~lib/@btc-vision/as-bignum/assembly/integer/i128/i128#constructor (param $0 i64) (param $1 i64)
  (local $2 i32)
  i32.const 16
  i32.const 33
  call $~lib/rt/stub/__new
  local.tee $2
  local.get $0
  i64.store
  local.get $2
  local.get $1
  i64.store offset=8
 )
 (func $start:~lib/@btc-vision/btc-runtime/runtime/index
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  i32.const 21436
  global.set $~lib/rt/stub/offset
  i64.const 0
  i64.const 0
  call $~lib/@btc-vision/as-bignum/assembly/integer/u128/u128#constructor
  drop
  i64.const 1
  i64.const 0
  call $~lib/@btc-vision/as-bignum/assembly/integer/u128/u128#constructor
  drop
  i64.const -1
  i64.const -1
  call $~lib/@btc-vision/as-bignum/assembly/integer/u128/u128#constructor
  drop
  i32.const 0
  i32.const 0
  i32.const 0
  i32.const 10
  i32.const 2880
  call $~lib/rt/__newArray
  call $~lib/@btc-vision/btc-runtime/runtime/types/Address/Address#constructor
  global.set $~lib/@btc-vision/btc-runtime/runtime/types/Address/ZERO_ADDRESS
  i32.const 16
  i32.const 12
  call $~lib/rt/stub/__new
  local.tee $1
  i32.const 0
  i32.store
  local.get $1
  i32.const 0
  i32.store offset=4
  local.get $1
  i32.const 0
  i32.store offset=8
  local.get $1
  i32.const 0
  i32.store offset=12
  i32.const 0
  i32.const 32
  call $~lib/typedarray/Uint8Array#constructor
  local.tee $2
  i32.const 32
  i32.const 2
  i32.const 11
  i32.const 2912
  call $~lib/rt/__newArray
  call $~lib/typedarray/Uint8Array#set<~lib/array/Array<i32>>
  i32.const 0
  i32.const 32
  call $~lib/typedarray/Uint8Array#constructor
  local.tee $3
  i32.const 32
  i32.const 2
  i32.const 11
  i32.const 3072
  call $~lib/rt/__newArray
  call $~lib/typedarray/Uint8Array#set<~lib/array/Array<i32>>
  i32.const 0
  i32.const 32
  call $~lib/typedarray/Uint8Array#constructor
  local.tee $4
  i32.const 32
  i32.const 2
  i32.const 11
  i32.const 3232
  call $~lib/rt/__newArray
  call $~lib/typedarray/Uint8Array#set<~lib/array/Array<i32>>
  i32.const 0
  i32.const 32
  call $~lib/typedarray/Uint8Array#constructor
  local.tee $0
  i32.const 32
  i32.const 2
  i32.const 11
  i32.const 3392
  call $~lib/rt/__newArray
  call $~lib/typedarray/Uint8Array#set<~lib/array/Array<i32>>
  local.get $1
  local.get $2
  i32.store
  local.get $1
  local.get $3
  i32.store offset=4
  local.get $1
  local.get $0
  i32.store offset=8
  local.get $1
  local.get $4
  i32.store offset=12
  local.get $1
  global.set $~lib/@btc-vision/btc-runtime/runtime/script/Networks/Network
  i32.const 0
  i32.const 32
  call $~lib/typedarray/Uint8Array#constructor
  global.set $~lib/@btc-vision/btc-runtime/runtime/math/bytes/EMPTY_BUFFER
  i32.const 0
  i32.const 30
  call $~lib/typedarray/Uint8Array#constructor
  global.set $~lib/@btc-vision/btc-runtime/runtime/math/bytes/EMPTY_POINTER
  i32.const 0
  i32.const 32
  call $~lib/typedarray/Uint8Array#constructor
  global.set $~lib/@btc-vision/btc-runtime/runtime/math/bytes/ONE_BUFFER
  global.get $~lib/@btc-vision/btc-runtime/runtime/math/bytes/ONE_BUFFER
  i32.const 31
  i32.const 1
  call $~lib/typedarray/Uint8Array#__set
  i32.const 3888
  i32.const 3888
  call $~lib/@btc-vision/btc-runtime/runtime/types/ExtendedAddress/ExtendedAddress#constructor
  drop
  i32.const 3776
  i32.const 3888
  call $~lib/@btc-vision/btc-runtime/runtime/types/ExtendedAddress/ExtendedAddress#constructor
  drop
  i32.const 256
  call $~lib/arraybuffer/ArrayBuffer#constructor
  global.set $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/SCRATCH_BUF
  i32.const 1
  global.set $~argumentsLength
  global.get $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/SCRATCH_BUF
  call $~lib/typedarray/Uint8Array.wrap@varargs
  drop
  i32.const 0
  i32.const 4
  call $~lib/typedarray/Uint8Array#constructor
  global.set $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/FOUR_BYTES_UINT8ARRAY_MEMORY_CACHE
  i32.const 52
  i32.const 16
  call $~lib/rt/stub/__new
  call $~lib/object/Object#constructor
  local.set $1
  global.get $~lib/@btc-vision/btc-runtime/runtime/types/ExtendedAddressCache/_cachedDeadAddress
  local.tee $0
  i32.eqz
  if
   i32.const 3776
   i32.const 3888
   call $~lib/@btc-vision/btc-runtime/runtime/types/ExtendedAddress/ExtendedAddress#constructor
   local.tee $0
   global.set $~lib/@btc-vision/btc-runtime/runtime/types/ExtendedAddressCache/_cachedDeadAddress
  end
  local.get $1
  local.get $0
  call $~lib/@btc-vision/btc-runtime/runtime/types/ExtendedAddress/ExtendedAddress#clone
  i32.store
  local.get $1
  call $~lib/@btc-vision/btc-runtime/runtime/generic/MapUint8Array/MapUint8Array#constructor
  i32.store offset=4
  local.get $1
  call $~lib/@btc-vision/btc-runtime/runtime/generic/MapUint8Array/MapUint8Array#constructor
  i32.store offset=8
  local.get $1
  i32.const 0
  i32.store offset=12
  local.get $1
  i32.const -1
  i32.store offset=16
  local.get $1
  i32.const 0
  i32.store offset=20
  local.get $1
  i32.const 0
  i32.store offset=24
  local.get $1
  i32.const 0
  i32.store offset=28
  local.get $1
  i32.const 0
  i32.store16 offset=32
  local.get $1
  i32.const 0
  i32.store offset=36
  local.get $1
  i32.const 0
  i32.store offset=40
  local.get $1
  i32.const 0
  i32.store offset=44
  local.get $1
  i32.const 0
  i32.store offset=48
  local.get $1
  global.set $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
  i64.const 0
  i64.const 0
  i64.const 0
  i64.const 0
  call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#constructor
  drop
  i64.const 1
  i64.const 0
  i64.const 0
  i64.const 0
  call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#constructor
  drop
  i64.const 2
  i64.const 0
  i64.const 0
  i64.const 0
  call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#constructor
  drop
  i64.const 3
  i64.const 0
  i64.const 0
  i64.const 0
  call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#constructor
  drop
  i64.const 10
  i64.const 0
  i64.const 0
  i64.const 0
  call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#constructor
  drop
  i64.const 4294967295
  i64.const 0
  i64.const 0
  i64.const 0
  call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#constructor
  global.set $~lib/@btc-vision/btc-runtime/runtime/storage/StoredString/StoredString.MAX_LENGTH_U256
  global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
  call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#get:nextPointer
  i32.const 65535
  i32.and
  global.set $~lib/@btc-vision/btc-runtime/runtime/contracts/ReentrancyGuard/statusPointer
  global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
  call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#get:nextPointer
  i32.const 65535
  i32.and
  global.set $~lib/@btc-vision/btc-runtime/runtime/contracts/ReentrancyGuard/depthPointer
  global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
  call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#get:nextPointer
  drop
  global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
  call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#get:nextPointer
  drop
  global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
  call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#get:nextPointer
  drop
  global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
  call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#get:nextPointer
  drop
  global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
  call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#get:nextPointer
  drop
  global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
  call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#get:nextPointer
  drop
  global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
  call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#get:nextPointer
  drop
  global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
  call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#get:nextPointer
  drop
  global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
  call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#get:nextPointer
  drop
  global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
  call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#get:nextPointer
  drop
  global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
  call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#get:nextPointer
  drop
  global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
  call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#get:nextPointer
  drop
  global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
  call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#get:nextPointer
  drop
  global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
  call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#get:nextPointer
  drop
  i64.const 0
  i64.const 0
  call $~lib/@btc-vision/as-bignum/assembly/integer/i128/i128#constructor
  i64.const 1
  i64.const 0
  call $~lib/@btc-vision/as-bignum/assembly/integer/i128/i128#constructor
  i64.const -1
  i64.const -1
  call $~lib/@btc-vision/as-bignum/assembly/integer/i128/i128#constructor
  i64.const 0
  i64.const -9223372036854775808
  call $~lib/@btc-vision/as-bignum/assembly/integer/i128/i128#constructor
  i64.const -1
  i64.const 9223372036854775807
  call $~lib/@btc-vision/as-bignum/assembly/integer/i128/i128#constructor
  block $__inlined_func$start:~lib/@btc-vision/btc-runtime/runtime/secp256k1/ECPoint$333
   block $folding-inner0
    i32.const 5404
    i32.load
    i32.const 32
    i32.ne
    br_if $folding-inner0
    i32.const 5396
    i32.load
    local.tee $0
    i64.load
    local.get $0
    i64.load offset=8
    local.get $0
    i64.load offset=16
    local.get $0
    i64.load offset=24
    call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#constructor
    drop
    i32.const 5516
    i32.load
    i32.const 32
    i32.ne
    br_if $folding-inner0
    i32.const 5508
    i32.load
    local.tee $0
    i64.load
    local.get $0
    i64.load offset=8
    local.get $0
    i64.load offset=16
    local.get $0
    i64.load offset=24
    call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#constructor
    drop
    i32.const 5628
    i32.load
    i32.const 32
    i32.ne
    br_if $folding-inner0
    i32.const 5620
    i32.load
    local.tee $0
    i64.load
    local.get $0
    i64.load offset=8
    local.get $0
    i64.load offset=16
    local.get $0
    i64.load offset=24
    call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#constructor
    drop
    br $__inlined_func$start:~lib/@btc-vision/btc-runtime/runtime/secp256k1/ECPoint$333
   end
   i32.const 2304
   i32.const 5664
   i32.const 169
   i32.const 30
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
  call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#get:nextPointer
  i32.const 65535
  i32.and
  global.set $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/stringPointer
  global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
  call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#get:nextPointer
  i32.const 65535
  i32.and
  global.set $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/totalSupplyPointer
  global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
  call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#get:nextPointer
  i32.const 65535
  i32.and
  global.set $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/maxSupplyPointer
  global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
  call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#get:nextPointer
  i32.const 65535
  i32.and
  global.set $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/ownerOfMapPointer
  global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
  call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#get:nextPointer
  i32.const 65535
  i32.and
  global.set $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/tokenApprovalMapPointer
  global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
  call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#get:nextPointer
  i32.const 65535
  i32.and
  global.set $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/operatorApprovalMapPointer
  global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
  call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#get:nextPointer
  i32.const 65535
  i32.and
  global.set $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/balanceOfMapPointer
  global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
  call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#get:nextPointer
  i32.const 65535
  i32.and
  global.set $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/tokenURIMapPointer
  global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
  call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#get:nextPointer
  i32.const 65535
  i32.and
  global.set $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/nextTokenIdPointer
  global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
  call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#get:nextPointer
  i32.const 65535
  i32.and
  global.set $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/ownerTokensMapPointer
  global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
  call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#get:nextPointer
  i32.const 65535
  i32.and
  global.set $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/tokenIndexMapPointer
  global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
  call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#get:nextPointer
  i32.const 65535
  i32.and
  global.set $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/initializedPointer
  global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
  call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#get:nextPointer
  i32.const 65535
  i32.and
  global.set $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/tokenURICounterPointer
  global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
  call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#get:nextPointer
  i32.const 65535
  i32.and
  global.set $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/approveNonceMapPointer
  global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
  call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#get:nextPointer
  drop
  global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
  call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#get:nextPointer
  drop
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/math/abi/encodePointer (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (result i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  local.get $1
  i32.load offset=8
  i32.const 30
  i32.lt_s
  if
   i32.const 0
   i32.const 30
   call $~lib/typedarray/Uint8Array#constructor
   local.set $4
   loop $for-loop|0
    local.get $5
    local.get $1
    i32.load offset=8
    i32.lt_s
    if
     local.get $4
     local.get $5
     local.get $1
     local.get $5
     call $~lib/typedarray/Uint8Array#__get
     call $~lib/typedarray/Uint8Array#__set
     local.get $5
     i32.const 1
     i32.add
     local.set $5
     br $for-loop|0
    end
   end
   local.get $4
   local.set $1
  end
  local.get $2
  if
   local.get $1
   i32.load offset=8
   i32.const 30
   i32.ne
   if
    i32.const 8080
    i32.const 1
    local.get $1
    i32.load offset=8
    call $~lib/number/I32#toString
    call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
    i32.const 8080
    i32.const 3
    local.get $3
    call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
    i32.const 8080
    call $~lib/staticarray/StaticArray<~lib/string/String>#join
    i32.const 8128
    i32.const 101
    i32.const 9
    call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
    unreachable
   end
  end
  i32.const 0
  i32.const 32
  call $~lib/typedarray/Uint8Array#constructor
  local.tee $2
  i32.const 0
  local.get $0
  i32.const 65535
  i32.and
  i32.const 8
  i32.shr_u
  call $~lib/typedarray/Uint8Array#__set
  local.get $2
  i32.const 1
  local.get $0
  i32.const 255
  i32.and
  call $~lib/typedarray/Uint8Array#__set
  loop $for-loop|1
   local.get $6
   i32.const 30
   i32.lt_s
   if
    local.get $2
    local.get $6
    i32.const 2
    i32.add
    local.get $1
    local.get $6
    call $~lib/typedarray/Uint8Array#__get
    call $~lib/typedarray/Uint8Array#__set
    local.get $6
    i32.const 1
    i32.add
    local.set $6
    br $for-loop|1
   end
  end
  local.get $2
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/storage/StoredU256/StoredU256#constructor (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  i32.const 16
  i32.const 39
  call $~lib/rt/stub/__new
  local.tee $2
  local.get $0
  i32.store16 offset=4
  local.get $2
  local.get $1
  i32.store offset=8
  local.get $2
  i32.const 0
  i32.store
  local.get $2
  i64.const 0
  i64.const 0
  i64.const 0
  i64.const 0
  call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#constructor
  i32.store offset=12
  local.get $2
  local.get $0
  local.get $1
  i32.const 1
  i32.const 8256
  call $~lib/@btc-vision/btc-runtime/runtime/math/abi/encodePointer
  i32.store
  local.get $2
 )
 (func $~lib/array/Array<u64>#__set (param $0 i32) (param $1 i32) (param $2 i64)
  (local $3 i32)
  local.get $1
  local.get $0
  i32.load offset=12
  i32.ge_u
  if
   local.get $1
   i32.const 0
   i32.lt_s
   if
    i32.const 2176
    i32.const 4192
    i32.const 132
    i32.const 22
    call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
    unreachable
   end
   local.get $0
   local.get $1
   i32.const 1
   i32.add
   local.tee $3
   i32.const 3
   i32.const 1
   call $~lib/array/ensureCapacity
   local.get $0
   local.get $3
   i32.store offset=12
  end
  local.get $0
  i32.load offset=4
  local.get $1
  i32.const 3
  i32.shl
  i32.add
  local.get $2
  i64.store
 )
 (func $~lib/array/Array<u64>#__get (param $0 i32) (param $1 i32) (result i64)
  local.get $1
  local.get $0
  i32.load offset=12
  i32.ge_u
  if
   i32.const 2176
   i32.const 4192
   i32.const 116
   i32.const 42
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $0
  i32.load offset=4
  local.get $1
  i32.const 3
  i32.shl
  i32.add
  i64.load
 )
 (func $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#clone (param $0 i32) (result i32)
  local.get $0
  i64.load
  local.get $0
  i64.load offset=8
  local.get $0
  i64.load offset=16
  local.get $0
  i64.load offset=24
  call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#constructor
 )
 (func $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256.shl (param $0 i32) (param $1 i32) (result i32)
  (local $2 i64)
  (local $3 i64)
  (local $4 i64)
  (local $5 i64)
  (local $6 i64)
  (local $7 i64)
  (local $8 i32)
  (local $9 i32)
  (local $10 i64)
  local.get $1
  i32.const 0
  i32.le_s
  if
   local.get $1
   if (result i32)
    i64.const 0
    i64.const 0
    i64.const 0
    i64.const 0
    call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#constructor
   else
    local.get $0
    call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#clone
   end
   return
  end
  local.get $1
  i32.const 256
  i32.ge_s
  if
   i64.const 0
   i64.const 0
   i64.const 0
   i64.const 0
   call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#constructor
   return
  end
  local.get $1
  i32.const 255
  i32.and
  local.tee $8
  i32.const 6
  i32.shr_u
  local.set $1
  i32.const 64
  local.get $8
  i32.const 63
  i32.and
  local.tee $8
  i32.sub
  local.set $9
  local.get $0
  i64.load
  local.set $10
  local.get $0
  i64.load offset=8
  local.set $2
  local.get $0
  i64.load offset=16
  local.set $3
  local.get $0
  i64.load offset=24
  local.set $6
  local.get $1
  if (result i64)
   local.get $1
   i32.const 1
   i32.eq
   if (result i64)
    local.get $10
    local.get $8
    i64.extend_i32_s
    i64.shl
    local.set $5
    local.get $2
    local.get $8
    i64.extend_i32_s
    i64.shl
    local.get $10
    local.get $9
    i64.extend_i32_s
    i64.shr_u
    i64.const 0
    local.get $8
    select
    i64.or
    local.set $4
    local.get $3
    local.get $8
    i64.extend_i32_s
    i64.shl
    local.get $2
    local.get $9
    i64.extend_i32_s
    i64.shr_u
    i64.const 0
    local.get $8
    select
    i64.or
   else
    local.get $1
    i32.const 2
    i32.eq
    if (result i64)
     local.get $10
     local.get $8
     i64.extend_i32_s
     i64.shl
     local.set $4
     local.get $2
     local.get $8
     i64.extend_i32_s
     i64.shl
     local.get $10
     local.get $9
     i64.extend_i32_s
     i64.shr_u
     i64.const 0
     local.get $8
     select
     i64.or
    else
     local.get $10
     local.get $8
     i64.extend_i32_s
     i64.shl
     i64.const 0
     local.get $1
     i32.const 3
     i32.eq
     select
    end
   end
  else
   local.get $10
   local.get $8
   i64.extend_i32_s
   i64.shl
   local.set $7
   local.get $2
   local.get $8
   i64.extend_i32_s
   i64.shl
   local.get $10
   local.get $9
   i64.extend_i32_s
   i64.shr_u
   i64.const 0
   local.get $8
   select
   i64.or
   local.set $5
   local.get $3
   local.get $8
   i64.extend_i32_s
   i64.shl
   local.get $2
   local.get $9
   i64.extend_i32_s
   i64.shr_u
   i64.const 0
   local.get $8
   select
   i64.or
   local.set $4
   local.get $6
   local.get $8
   i64.extend_i32_s
   i64.shl
   local.get $3
   local.get $9
   i64.extend_i32_s
   i64.shr_u
   i64.const 0
   local.get $8
   select
   i64.or
  end
  local.set $2
  local.get $7
  local.get $5
  local.get $4
  local.get $2
  call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#constructor
 )
 (func $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256.add (param $0 i32) (param $1 i32) (result i32)
  (local $2 i64)
  (local $3 i64)
  (local $4 i64)
  (local $5 i64)
  (local $6 i64)
  (local $7 i64)
  local.get $0
  i64.load
  local.tee $3
  local.get $1
  i64.load
  i64.add
  local.set $2
  local.get $2
  local.get $3
  i64.lt_u
  i64.extend_i32_s
  global.set $~lib/@btc-vision/as-bignum/assembly/globals/__u256carry
  local.get $0
  i64.load offset=8
  local.tee $3
  global.get $~lib/@btc-vision/as-bignum/assembly/globals/__u256carry
  i64.add
  local.tee $4
  local.get $1
  i64.load offset=8
  i64.add
  local.set $5
  local.get $3
  local.get $4
  i64.gt_u
  local.get $4
  local.get $5
  i64.gt_u
  i32.add
  i64.extend_i32_s
  global.set $~lib/@btc-vision/as-bignum/assembly/globals/__u256carry
  local.get $0
  i64.load offset=16
  local.tee $3
  global.get $~lib/@btc-vision/as-bignum/assembly/globals/__u256carry
  i64.add
  local.tee $4
  local.get $1
  i64.load offset=16
  i64.add
  local.set $6
  local.get $3
  local.get $4
  i64.gt_u
  local.get $4
  local.get $6
  i64.gt_u
  i32.add
  i64.extend_i32_s
  global.set $~lib/@btc-vision/as-bignum/assembly/globals/__u256carry
  local.get $0
  i64.load offset=24
  local.tee $4
  global.get $~lib/@btc-vision/as-bignum/assembly/globals/__u256carry
  i64.add
  local.tee $3
  local.get $1
  i64.load offset=24
  i64.add
  local.set $7
  local.get $3
  local.get $4
  i64.lt_u
  local.get $3
  local.get $7
  i64.gt_u
  i32.add
  i64.extend_i32_s
  global.set $~lib/@btc-vision/as-bignum/assembly/globals/__u256carry
  local.get $2
  local.get $5
  local.get $6
  local.get $7
  call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#constructor
 )
 (func $~lib/@btc-vision/as-bignum/assembly/globals/__mul256 (param $0 i64) (param $1 i64) (param $2 i64) (param $3 i64) (param $4 i64) (param $5 i64) (param $6 i64) (param $7 i64) (result i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  (local $14 i32)
  i64.const 0
  i64.const 0
  i64.const 0
  i64.const 0
  call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#constructor
  local.set $8
  i32.const 4
  i32.const 3
  i32.const 57
  i32.const 0
  call $~lib/rt/__newArray
  local.tee $10
  i32.const 0
  local.get $0
  call $~lib/array/Array<u64>#__set
  local.get $10
  i32.const 1
  local.get $1
  call $~lib/array/Array<u64>#__set
  local.get $10
  i32.const 2
  local.get $2
  call $~lib/array/Array<u64>#__set
  local.get $10
  i32.const 3
  local.get $3
  call $~lib/array/Array<u64>#__set
  i32.const 4
  i32.const 3
  i32.const 57
  i32.const 0
  call $~lib/rt/__newArray
  local.tee $11
  i32.const 0
  local.get $4
  call $~lib/array/Array<u64>#__set
  local.get $11
  i32.const 1
  local.get $5
  call $~lib/array/Array<u64>#__set
  local.get $11
  i32.const 2
  local.get $6
  call $~lib/array/Array<u64>#__set
  local.get $11
  i32.const 3
  local.get $7
  call $~lib/array/Array<u64>#__set
  loop $for-loop|0
   local.get $12
   i32.const 4
   i32.lt_s
   if
    i32.const 0
    local.set $9
    loop $for-loop|1
     local.get $9
     i32.const 4
     i32.lt_s
     if
      local.get $9
      local.get $12
      i32.add
      i32.const 6
      i32.shl
      local.tee $13
      i32.const 256
      i32.lt_s
      if
       local.get $10
       local.get $12
       call $~lib/array/Array<u64>#__get
       local.tee $0
       i64.const 32
       i64.shr_u
       local.set $1
       local.get $11
       local.get $9
       call $~lib/array/Array<u64>#__get
       local.tee $2
       i64.const 4294967295
       i64.and
       local.tee $3
       local.get $0
       i64.const 4294967295
       i64.and
       local.tee $0
       i64.mul
       local.set $4
       local.get $2
       i64.const 32
       i64.shr_u
       local.tee $2
       local.get $0
       i64.mul
       local.get $1
       local.get $3
       i64.mul
       local.get $4
       i64.const 32
       i64.shr_u
       i64.add
       local.tee $0
       i64.const 4294967295
       i64.and
       i64.add
       local.set $3
       local.get $1
       local.get $2
       i64.mul
       local.get $0
       i64.const 32
       i64.shr_u
       i64.add
       local.get $3
       i64.const 32
       i64.shr_u
       i64.add
       global.set $~lib/@btc-vision/as-bignum/assembly/globals/__res128_hi
       local.get $4
       i64.const 4294967295
       i64.and
       local.get $3
       i64.const 32
       i64.shl
       i64.or
       global.get $~lib/@btc-vision/as-bignum/assembly/globals/__res128_hi
       call $~lib/@btc-vision/as-bignum/assembly/integer/u128/u128#constructor
       local.tee $14
       i64.load
       local.get $14
       i64.load offset=8
       i64.const 0
       i64.const 0
       call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#constructor
       local.set $14
       local.get $8
       local.get $13
       if (result i32)
        local.get $14
        local.get $13
        call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256.shl
       else
        local.get $14
       end
       call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256.add
       local.set $8
      end
      local.get $9
      i32.const 1
      i32.add
      local.set $9
      br $for-loop|1
     end
    end
    local.get $12
    i32.const 1
    i32.add
    local.set $12
    br $for-loop|0
   end
  end
  local.get $8
 )
 (func $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256.lt (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  i64.load offset=24
  local.get $1
  i64.load offset=24
  i64.ne
  if
   local.get $0
   i64.load offset=24
   local.get $1
   i64.load offset=24
   i64.lt_u
   return
  end
  local.get $0
  i64.load offset=16
  local.get $1
  i64.load offset=16
  i64.ne
  if
   local.get $0
   i64.load offset=16
   local.get $1
   i64.load offset=16
   i64.lt_u
   return
  end
  local.get $0
  i64.load offset=8
  local.get $1
  i64.load offset=8
  i64.ne
  if
   local.get $0
   i64.load offset=8
   local.get $1
   i64.load offset=8
   i64.lt_u
   return
  end
  local.get $0
  i64.load
  local.get $1
  i64.load
  i64.lt_u
 )
 (func $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256.div (param $0 i32) (param $1 i32) (result i32)
  (local $2 i64)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i64)
  (local $7 i64)
  (local $8 i64)
  (local $9 i64)
  (local $10 i64)
  local.get $1
  i64.load offset=24
  local.get $1
  i64.load offset=16
  local.get $1
  i64.load
  local.get $1
  i64.load offset=8
  i64.or
  i64.or
  i64.or
  i64.eqz
  if
   i32.const 8304
   i32.const 5664
   i32.const 353
   i32.const 21
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $0
  i64.load offset=24
  local.get $0
  i64.load offset=16
  local.get $0
  i64.load
  local.get $0
  i64.load offset=8
  i64.or
  i64.or
  i64.or
  i64.eqz
  if (result i32)
   i32.const 1
  else
   local.get $0
   local.get $1
   call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256.lt
  end
  if
   i64.const 0
   i64.const 0
   i64.const 0
   i64.const 0
   call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#constructor
   return
  end
  local.get $0
  i64.load
  local.get $1
  i64.load
  i64.eq
  if (result i32)
   local.get $0
   i64.load offset=8
   local.get $1
   i64.load offset=8
   i64.eq
  else
   i32.const 0
  end
  if (result i32)
   local.get $0
   i64.load offset=16
   local.get $1
   i64.load offset=16
   i64.eq
  else
   i32.const 0
  end
  if (result i32)
   local.get $0
   i64.load offset=24
   local.get $1
   i64.load offset=24
   i64.eq
  else
   i32.const 0
  end
  if
   i64.const 1
   i64.const 0
   i64.const 0
   i64.const 0
   call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#constructor
   return
  end
  local.get $0
  call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#clone
  local.set $5
  local.get $1
  call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#clone
  local.set $0
  i64.const 0
  i64.const 0
  i64.const 0
  i64.const 0
  call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#constructor
  call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#clone
  local.set $3
  local.get $0
  block $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256.clz|inlined.0 (result i32)
   local.get $0
   i64.load offset=24
   i64.const 0
   i64.ne
   if
    local.get $0
    i64.load offset=24
    i64.clz
    i32.wrap_i64
    br $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256.clz|inlined.0
   end
   local.get $0
   i64.load offset=16
   i64.const 0
   i64.ne
   if
    local.get $0
    i64.load offset=16
    i64.clz
    i64.const -64
    i64.sub
    i32.wrap_i64
    br $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256.clz|inlined.0
   end
   local.get $0
   i64.load offset=8
   i64.const 0
   i64.ne
   if
    local.get $0
    i64.load offset=8
    i64.clz
    i64.const 128
    i64.add
    i32.wrap_i64
    br $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256.clz|inlined.0
   end
   local.get $0
   i64.load
   i64.const 0
   i64.ne
   if
    local.get $0
    i64.load
    i64.clz
    i64.const 192
    i64.add
    i32.wrap_i64
    br $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256.clz|inlined.0
   end
   i32.const 256
  end
  block $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256.clz|inlined.1 (result i32)
   local.get $5
   i64.load offset=24
   i64.const 0
   i64.ne
   if
    local.get $5
    i64.load offset=24
    i64.clz
    i32.wrap_i64
    br $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256.clz|inlined.1
   end
   local.get $5
   i64.load offset=16
   i64.const 0
   i64.ne
   if
    local.get $5
    i64.load offset=16
    i64.clz
    i64.const -64
    i64.sub
    i32.wrap_i64
    br $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256.clz|inlined.1
   end
   local.get $5
   i64.load offset=8
   i64.const 0
   i64.ne
   if
    local.get $5
    i64.load offset=8
    i64.clz
    i64.const 128
    i64.add
    i32.wrap_i64
    br $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256.clz|inlined.1
   end
   local.get $5
   i64.load
   i64.const 0
   i64.ne
   if
    local.get $5
    i64.load
    i64.clz
    i64.const 192
    i64.add
    i32.wrap_i64
    br $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256.clz|inlined.1
   end
   i32.const 256
  end
  i32.sub
  local.tee $1
  call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256.shl
  local.set $0
  loop $for-loop|0
   local.get $1
   i32.const 0
   i32.ge_s
   if
    local.get $5
    local.get $0
    call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256.lt
    i32.eqz
    if
     local.get $5
     i64.load
     local.tee $2
     local.get $0
     i64.load
     i64.sub
     local.tee $6
     local.get $6
     i64.lt_u
     local.get $2
     local.get $6
     i64.lt_u
     i32.add
     i64.extend_i32_s
     global.set $~lib/@btc-vision/as-bignum/assembly/globals/__u256carrySub
     local.get $5
     i64.load offset=8
     local.tee $2
     local.get $0
     i64.load offset=8
     i64.sub
     local.tee $7
     global.get $~lib/@btc-vision/as-bignum/assembly/globals/__u256carrySub
     i64.sub
     local.set $8
     local.get $7
     local.get $8
     i64.lt_u
     local.get $2
     local.get $7
     i64.lt_u
     i32.add
     i64.extend_i32_s
     global.set $~lib/@btc-vision/as-bignum/assembly/globals/__u256carrySub
     local.get $5
     i64.load offset=16
     local.tee $2
     local.get $0
     i64.load offset=16
     i64.sub
     local.tee $7
     global.get $~lib/@btc-vision/as-bignum/assembly/globals/__u256carrySub
     i64.sub
     local.set $9
     local.get $7
     local.get $9
     i64.lt_u
     local.get $2
     local.get $7
     i64.lt_u
     i32.add
     i64.extend_i32_s
     global.set $~lib/@btc-vision/as-bignum/assembly/globals/__u256carrySub
     local.get $5
     i64.load offset=24
     local.tee $7
     local.get $0
     i64.load offset=24
     i64.sub
     local.tee $10
     global.get $~lib/@btc-vision/as-bignum/assembly/globals/__u256carrySub
     i64.sub
     local.set $2
     local.get $7
     local.get $10
     i64.lt_u
     local.get $2
     local.get $10
     i64.gt_u
     i32.add
     i64.extend_i32_s
     global.set $~lib/@btc-vision/as-bignum/assembly/globals/__u256carrySub
     local.get $5
     local.get $6
     i64.store
     local.get $5
     local.get $8
     i64.store offset=8
     local.get $5
     local.get $9
     i64.store offset=16
     local.get $5
     local.get $2
     i64.store offset=24
     i64.const 1
     local.get $1
     i32.const 64
     i32.rem_s
     i64.extend_i32_s
     i64.shl
     local.set $2
     local.get $1
     i32.const 64
     i32.div_s
     local.tee $4
     if
      local.get $4
      i32.const 1
      i32.eq
      if
       local.get $3
       local.get $3
       i64.load offset=8
       local.get $2
       i64.or
       i64.store offset=8
      else
       local.get $4
       i32.const 2
       i32.eq
       if
        local.get $3
        local.get $3
        i64.load offset=16
        local.get $2
        i64.or
        i64.store offset=16
       else
        local.get $4
        i32.const 3
        i32.eq
        if
         local.get $3
         local.get $3
         i64.load offset=24
         local.get $2
         i64.or
         i64.store offset=24
        end
       end
      end
     else
      local.get $3
      local.get $3
      i64.load
      local.get $2
      i64.or
      i64.store
     end
    end
    local.get $0
    local.get $0
    i64.load offset=8
    i64.const 63
    i64.shl
    local.get $0
    i64.load
    i64.const 1
    i64.shr_u
    i64.or
    i64.store
    local.get $0
    local.get $0
    i64.load offset=16
    i64.const 63
    i64.shl
    local.get $0
    i64.load offset=8
    i64.const 1
    i64.shr_u
    i64.or
    i64.store offset=8
    local.get $0
    local.get $0
    i64.load offset=24
    i64.const 63
    i64.shl
    local.get $0
    i64.load offset=16
    i64.const 1
    i64.shr_u
    i64.or
    i64.store offset=16
    local.get $0
    local.get $0
    i64.load offset=24
    i64.const 1
    i64.shr_u
    i64.store offset=24
    local.get $1
    i32.const 1
    i32.sub
    local.set $1
    br $for-loop|0
   end
  end
  local.get $3
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/types/SafeMath/SafeMath.mul (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $0
  i64.load offset=24
  local.get $0
  i64.load offset=16
  local.get $0
  i64.load
  local.get $0
  i64.load offset=8
  i64.or
  i64.or
  i64.or
  i64.eqz
  if (result i64)
   i64.const 0
  else
   local.get $1
   i64.load offset=24
   local.get $1
   i64.load offset=16
   local.get $1
   i64.load
   local.get $1
   i64.load offset=8
   i64.or
   i64.or
   i64.or
  end
  i64.eqz
  if
   i64.const 0
   i64.const 0
   i64.const 0
   i64.const 0
   call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#constructor
   return
  end
  local.get $0
  i64.load
  local.get $0
  i64.load offset=8
  local.get $0
  i64.load offset=16
  local.get $0
  i64.load offset=24
  local.get $1
  i64.load
  local.get $1
  i64.load offset=8
  local.get $1
  i64.load offset=16
  local.get $1
  i64.load offset=24
  call $~lib/@btc-vision/as-bignum/assembly/globals/__mul256
  local.tee $2
  local.get $0
  call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256.div
  local.tee $0
  i64.load
  local.get $1
  i64.load
  i64.eq
  if (result i32)
   local.get $0
   i64.load offset=8
   local.get $1
   i64.load offset=8
   i64.eq
  else
   i32.const 0
  end
  if (result i32)
   local.get $0
   i64.load offset=16
   local.get $1
   i64.load offset=16
   i64.eq
  else
   i32.const 0
  end
  if (result i32)
   local.get $0
   i64.load offset=24
   local.get $1
   i64.load offset=24
   i64.eq
  else
   i32.const 0
  end
  i32.eqz
  if
   i32.const 8368
   i32.const 8464
   i32.const 190
   i32.const 28
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $2
 )
 (func $~lib/polyfills/bswap<u64> (param $0 i64) (result i64)
  local.get $0
  i64.const 8
  i64.shr_u
  i64.const 71777214294589695
  i64.and
  local.get $0
  i64.const 71777214294589695
  i64.and
  i64.const 8
  i64.shl
  i64.or
  local.tee $0
  i64.const 16
  i64.shr_u
  i64.const 281470681808895
  i64.and
  local.get $0
  i64.const 281470681808895
  i64.and
  i64.const 16
  i64.shl
  i64.or
  i64.const 32
  i64.rotr
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/storage/StoredString/StoredString#constructor (param $0 i32) (param $1 i64) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  i32.const 16
  i32.const 41
  call $~lib/rt/stub/__new
  local.set $2
  block $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256.fromU64|inlined.1 (result i32)
   local.get $1
   i64.eqz
   if
    i64.const 0
    i64.const 0
    i64.const 0
    i64.const 0
    call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#constructor
    br $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256.fromU64|inlined.1
   end
   local.get $1
   i64.const 1
   i64.eq
   if
    i64.const 1
    i64.const 0
    i64.const 0
    i64.const 0
    call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#constructor
    br $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256.fromU64|inlined.1
   end
   local.get $1
   i64.const 0
   i64.const 0
   i64.const 0
   call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#constructor
  end
  global.get $~lib/@btc-vision/btc-runtime/runtime/storage/StoredString/StoredString.MAX_LENGTH_U256
  call $~lib/@btc-vision/btc-runtime/runtime/types/SafeMath/SafeMath.mul
  local.set $4
  i32.const 0
  i32.const 32
  call $~lib/typedarray/Uint8Array#constructor
  local.tee $3
  i32.load offset=4
  local.tee $5
  local.get $4
  i64.load offset=24
  call $~lib/polyfills/bswap<u64>
  i64.store
  local.get $5
  local.get $4
  i64.load offset=16
  call $~lib/polyfills/bswap<u64>
  i64.store offset=8
  local.get $5
  local.get $4
  i64.load offset=8
  call $~lib/polyfills/bswap<u64>
  i64.store offset=16
  local.get $5
  local.get $4
  i64.load
  call $~lib/polyfills/bswap<u64>
  i64.store offset=24
  local.get $3
  i32.const 2
  i32.const 32
  call $~lib/typedarray/Uint8Array#slice
  local.set $3
  local.get $2
  i32.eqz
  if
   i32.const 16
   i32.const 42
   call $~lib/rt/stub/__new
   local.set $2
  end
  local.get $2
  local.get $0
  i32.store16 offset=8
  local.get $2
  i32.const 0
  i32.store
  local.get $2
  i32.const 0
  i32.store offset=4
  local.get $2
  i32.const 2032
  i32.store offset=12
  local.get $2
  local.get $3
  i32.store offset=4
  local.get $2
  i32.const -1
  i32.store
  local.get $2
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/storage/maps/StoredMapU256/StoredMapU256#constructor@varargs (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  block $1of1
   block $0of1
    block $outOfRange
     global.get $~argumentsLength
     i32.const 1
     i32.sub
     br_table $0of1 $1of1 $outOfRange
    end
    unreachable
   end
   i32.const 0
   i32.const 30
   call $~lib/typedarray/Uint8Array#constructor
   local.set $2
  end
  i32.const 8
  i32.const 43
  call $~lib/rt/stub/__new
  local.tee $1
  i32.const 0
  i32.store16
  local.get $1
  i32.const 0
  i32.store offset=4
  local.get $1
  local.get $0
  i32.store16
  local.get $1
  local.get $2
  i32.store offset=4
  local.get $1
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/memory/AddressMemoryMap/AddressMemoryMap#constructor (param $0 i32) (result i32)
  (local $1 i32)
  i32.const 2
  i32.const 44
  call $~lib/rt/stub/__new
  local.tee $1
  i32.const 0
  i32.store16
  local.get $1
  local.get $0
  i32.store16
  local.get $1
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#constructor (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  local.get $0
  i32.eqz
  if
   i32.const 100
   i32.const 36
   call $~lib/rt/stub/__new
   local.set $0
  end
  local.get $0
  i32.const 0
  i32.store offset=16
  local.get $0
  i32.const 0
  i32.store offset=20
  local.get $0
  i32.const 0
  i32.store offset=24
  local.get $0
  i32.const 0
  i32.store offset=28
  local.get $0
  i32.const 0
  i32.store offset=32
  local.get $0
  i32.const 0
  i32.store offset=36
  local.get $0
  i32.const 0
  i32.store offset=40
  local.get $0
  i32.const 0
  i32.store offset=44
  local.get $0
  i32.const 0
  i32.store offset=48
  local.get $0
  i32.const 0
  i32.store offset=52
  local.get $0
  i32.const 0
  i32.store offset=56
  local.get $0
  i32.const 0
  i32.store offset=60
  local.get $0
  i32.const 0
  i32.store offset=64
  local.get $0
  i32.const 0
  i32.store offset=68
  local.get $0
  i32.const 0
  i32.store offset=72
  local.get $0
  i32.const 0
  i32.store offset=76
  local.get $0
  i32.const 0
  i32.store offset=80
  local.get $0
  i32.const 0
  i32.store offset=84
  i32.const 24
  i32.const 51
  call $~lib/rt/stub/__new
  local.tee $1
  i32.const 16
  call $~lib/arraybuffer/ArrayBuffer#constructor
  i32.store
  local.get $1
  i32.const 3
  i32.store offset=4
  local.get $1
  i32.const 48
  call $~lib/arraybuffer/ArrayBuffer#constructor
  i32.store offset=8
  local.get $1
  i32.const 4
  i32.store offset=12
  local.get $1
  i32.const 0
  i32.store offset=16
  local.get $1
  i32.const 0
  i32.store offset=20
  local.get $0
  local.get $1
  i32.store offset=88
  i32.const 24
  i32.const 56
  call $~lib/rt/stub/__new
  local.tee $1
  i32.const 16
  call $~lib/arraybuffer/ArrayBuffer#constructor
  i32.store
  local.get $1
  i32.const 3
  i32.store offset=4
  local.get $1
  i32.const 48
  call $~lib/arraybuffer/ArrayBuffer#constructor
  i32.store offset=8
  local.get $1
  i32.const 4
  i32.store offset=12
  local.get $1
  i32.const 0
  i32.store offset=16
  local.get $1
  i32.const 0
  i32.store offset=20
  local.get $0
  local.get $1
  i32.store offset=92
  local.get $0
  i32.const 0
  i32.store offset=96
  local.get $0
  i32.eqz
  if
   i32.const 16
   i32.const 37
   call $~lib/rt/stub/__new
   local.set $0
  end
  local.get $0
  i32.const 0
  i32.store offset=4
  local.get $0
  i32.const 0
  i32.store offset=8
  local.get $0
  i32.const 0
  i32.store offset=12
  local.get $0
  if (result i32)
   local.get $0
  else
   i32.const 4
   i32.const 20
   call $~lib/rt/stub/__new
  end
  call $~lib/object/Object#constructor
  local.tee $0
  i32.const 0
  i32.const 2
  i32.const 23
  i32.const 7808
  call $~lib/rt/__newArray
  i32.store
  global.get $~lib/@btc-vision/btc-runtime/runtime/contracts/ReentrancyGuard/statusPointer
  local.set $1
  i32.const 12
  i32.const 38
  call $~lib/rt/stub/__new
  local.tee $2
  local.get $1
  i32.store16 offset=6
  local.get $2
  i32.const 0
  i32.store
  local.get $2
  i32.const 0
  i32.store8 offset=4
  local.get $2
  i32.const 0
  i32.store8 offset=5
  local.get $2
  i32.const 0
  i32.store offset=8
  local.get $2
  local.get $1
  global.get $~lib/@btc-vision/btc-runtime/runtime/math/bytes/EMPTY_POINTER
  i32.const 1
  i32.const 7840
  call $~lib/@btc-vision/btc-runtime/runtime/math/abi/encodePointer
  i32.store
  local.get $2
  i32.const 0
  i32.store8 offset=4
  local.get $2
  i32.const 0
  i32.const 32
  call $~lib/typedarray/Uint8Array#constructor
  i32.store offset=8
  local.get $2
  i32.const 0
  i32.store8 offset=5
  local.get $0
  local.get $2
  i32.store offset=4
  local.get $0
  global.get $~lib/@btc-vision/btc-runtime/runtime/contracts/ReentrancyGuard/depthPointer
  global.get $~lib/@btc-vision/btc-runtime/runtime/math/bytes/EMPTY_POINTER
  call $~lib/@btc-vision/btc-runtime/runtime/storage/StoredU256/StoredU256#constructor
  i32.store offset=8
  local.get $0
  global.get $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/stringPointer
  i64.const 0
  call $~lib/@btc-vision/btc-runtime/runtime/storage/StoredString/StoredString#constructor
  i32.store offset=16
  local.get $0
  global.get $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/stringPointer
  i64.const 2
  call $~lib/@btc-vision/btc-runtime/runtime/storage/StoredString/StoredString#constructor
  i32.store offset=20
  local.get $0
  global.get $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/stringPointer
  i64.const 3
  call $~lib/@btc-vision/btc-runtime/runtime/storage/StoredString/StoredString#constructor
  i32.store offset=24
  local.get $0
  global.get $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/stringPointer
  i64.const 4
  call $~lib/@btc-vision/btc-runtime/runtime/storage/StoredString/StoredString#constructor
  i32.store offset=28
  local.get $0
  global.get $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/stringPointer
  i64.const 5
  call $~lib/@btc-vision/btc-runtime/runtime/storage/StoredString/StoredString#constructor
  i32.store offset=32
  local.get $0
  global.get $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/stringPointer
  i64.const 6
  call $~lib/@btc-vision/btc-runtime/runtime/storage/StoredString/StoredString#constructor
  i32.store offset=36
  local.get $0
  global.get $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/stringPointer
  i64.const 7
  call $~lib/@btc-vision/btc-runtime/runtime/storage/StoredString/StoredString#constructor
  i32.store offset=40
  local.get $0
  global.get $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/totalSupplyPointer
  global.get $~lib/@btc-vision/btc-runtime/runtime/math/bytes/EMPTY_POINTER
  call $~lib/@btc-vision/btc-runtime/runtime/storage/StoredU256/StoredU256#constructor
  i32.store offset=44
  local.get $0
  global.get $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/maxSupplyPointer
  global.get $~lib/@btc-vision/btc-runtime/runtime/math/bytes/EMPTY_POINTER
  call $~lib/@btc-vision/btc-runtime/runtime/storage/StoredU256/StoredU256#constructor
  i32.store offset=48
  local.get $0
  global.get $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/nextTokenIdPointer
  global.get $~lib/@btc-vision/btc-runtime/runtime/math/bytes/EMPTY_POINTER
  call $~lib/@btc-vision/btc-runtime/runtime/storage/StoredU256/StoredU256#constructor
  i32.store offset=52
  local.get $0
  global.get $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/initializedPointer
  global.get $~lib/@btc-vision/btc-runtime/runtime/math/bytes/EMPTY_POINTER
  call $~lib/@btc-vision/btc-runtime/runtime/storage/StoredU256/StoredU256#constructor
  i32.store offset=56
  local.get $0
  global.get $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/tokenURICounterPointer
  global.get $~lib/@btc-vision/btc-runtime/runtime/math/bytes/EMPTY_POINTER
  call $~lib/@btc-vision/btc-runtime/runtime/storage/StoredU256/StoredU256#constructor
  i32.store offset=60
  i32.const 1
  global.set $~argumentsLength
  local.get $0
  global.get $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/ownerOfMapPointer
  call $~lib/@btc-vision/btc-runtime/runtime/storage/maps/StoredMapU256/StoredMapU256#constructor@varargs
  i32.store offset=64
  i32.const 1
  global.set $~argumentsLength
  local.get $0
  global.get $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/tokenApprovalMapPointer
  call $~lib/@btc-vision/btc-runtime/runtime/storage/maps/StoredMapU256/StoredMapU256#constructor@varargs
  i32.store offset=68
  local.get $0
  global.get $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/balanceOfMapPointer
  call $~lib/@btc-vision/btc-runtime/runtime/memory/AddressMemoryMap/AddressMemoryMap#constructor
  i32.store offset=72
  global.get $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/operatorApprovalMapPointer
  local.set $1
  i32.const 14
  i32.const 45
  call $~lib/rt/stub/__new
  local.tee $2
  i32.const 0
  i32.store16 offset=12
  local.get $2
  if (result i32)
   local.get $2
  else
   i32.const 12
   i32.const 47
   call $~lib/rt/stub/__new
  end
  call $~lib/object/Object#constructor
  local.tee $2
  i32.const 0
  i32.const 2
  i32.const 49
  i32.const 8592
  call $~lib/rt/__newArray
  i32.store
  local.get $2
  i32.const 0
  i32.const 2
  i32.const 50
  i32.const 8624
  call $~lib/rt/__newArray
  i32.store offset=4
  local.get $2
  i32.const -1
  i32.store offset=8
  local.get $2
  local.get $1
  i32.store16 offset=12
  local.get $0
  local.get $2
  i32.store offset=76
  local.get $0
  global.get $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/approveNonceMapPointer
  call $~lib/@btc-vision/btc-runtime/runtime/memory/AddressMemoryMap/AddressMemoryMap#constructor
  i32.store offset=80
  i32.const 1
  global.set $~argumentsLength
  local.get $0
  global.get $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/tokenURIMapPointer
  call $~lib/@btc-vision/btc-runtime/runtime/storage/maps/StoredMapU256/StoredMapU256#constructor@varargs
  i32.store offset=84
  i32.const 1
  global.set $~argumentsLength
  local.get $0
  global.get $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/tokenIndexMapPointer
  call $~lib/@btc-vision/btc-runtime/runtime/storage/maps/StoredMapU256/StoredMapU256#constructor@varargs
  i32.store offset=96
  local.get $0
 )
 (func $start:op721/index~anonymous|0 (result i32)
  (local $0 i32)
  i32.const 128
  i32.const 35
  call $~lib/rt/stub/__new
  local.tee $0
  i32.const 0
  i32.store offset=100
  local.get $0
  i32.const 0
  i32.store offset=104
  local.get $0
  i32.const 0
  i32.store offset=108
  local.get $0
  i32.const 0
  i32.store offset=112
  local.get $0
  i32.const 0
  i32.store offset=116
  local.get $0
  global.get $op721/DopamilioNFT/mintedWlPointer
  call $~lib/@btc-vision/btc-runtime/runtime/memory/AddressMemoryMap/AddressMemoryMap#constructor
  i32.store offset=120
  local.get $0
  global.get $op721/DopamilioNFT/mintedPubPointer
  call $~lib/@btc-vision/btc-runtime/runtime/memory/AddressMemoryMap/AddressMemoryMap#constructor
  i32.store offset=124
  local.get $0
  call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#constructor
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#createContractIfNotExists (param $0 i32)
  local.get $0
  i32.load offset=28
  i32.eqz
  if
   i32.const 8688
   i32.const 5168
   i32.const 1324
   i32.const 13
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $0
  i32.load offset=12
  i32.eqz
  if
   i32.const 0
   global.set $~argumentsLength
   local.get $0
   local.get $0
   i32.load offset=28
   i32.load
   call_indirect (type $7)
   i32.store offset=12
  end
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#constructor (param $0 i32) (result i32)
  (local $1 i32)
  i32.const 8
  i32.const 59
  call $~lib/rt/stub/__new
  local.tee $1
  i32.const 0
  i32.store
  local.get $1
  i32.const 0
  i32.store offset=4
  local.get $0
  i32.load
  local.set $0
  i32.const 1
  global.set $~argumentsLength
  local.get $1
  local.get $0
  call $~lib/dataview/DataView#constructor@varargs
  i32.store
  local.get $1
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#verifyEnd (param $0 i32) (param $1 i32)
  local.get $1
  local.get $0
  i32.load
  i32.load offset=8
  i32.gt_s
  if
   i32.const 8928
   i32.const 1
   local.get $1
   call $~lib/number/I32#toString
   call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
   i32.const 8928
   call $~lib/staticarray/StaticArray<~lib/string/String>#join
   i32.const 9072
   i32.const 1
   local.get $0
   i32.load
   i32.load offset=8
   call $~lib/number/I32#toString
   call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
   i32.const 9072
   call $~lib/staticarray/StaticArray<~lib/string/String>#join
   call $~lib/string/String#concat
   i32.const 9104
   i32.const 442
   i32.const 13
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readU8 (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  local.get $0
  local.get $0
  i32.load offset=4
  i32.const 1
  i32.add
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#verifyEnd
  local.get $0
  i32.load offset=4
  local.tee $1
  local.get $0
  i32.load
  local.tee $2
  i32.load offset=8
  i32.ge_u
  if
   i32.const 2176
   i32.const 2416
   i32.const 72
   i32.const 50
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $1
  local.get $2
  i32.load offset=4
  i32.add
  i32.load8_u
  local.get $0
  local.get $0
  i32.load offset=4
  i32.const 1
  i32.add
  i32.store offset=4
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readBytes (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  i32.const 0
  local.get $1
  call $~lib/typedarray/Uint8Array#constructor
  local.set $3
  loop $for-loop|0
   local.get $1
   local.get $4
   i32.gt_u
   if
    block $for-break0
     local.get $0
     call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readU8
     local.tee $5
     i32.const 1
     local.get $2
     select
     i32.eqz
     if
      local.get $3
      i32.load offset=8
      local.set $1
      i32.const 12
      i32.const 7
      call $~lib/rt/stub/__new
      local.tee $0
      local.get $3
      i32.load
      i32.store
      local.get $0
      local.get $1
      i32.const 0
      local.get $1
      i32.const 0
      i32.le_s
      select
      local.tee $2
      local.get $3
      i32.load offset=4
      i32.add
      i32.store offset=4
      local.get $0
      local.get $4
      i32.const 0
      i32.lt_s
      if (result i32)
       local.get $1
       local.get $4
       i32.add
       local.tee $1
       i32.const 0
       local.get $1
       i32.const 0
       i32.gt_s
       select
      else
       local.get $4
       local.get $1
       local.get $1
       local.get $4
       i32.gt_s
       select
      end
      local.tee $1
      local.get $2
      local.get $1
      local.get $2
      i32.gt_s
      select
      local.get $2
      i32.sub
      i32.store offset=8
      local.get $0
      local.set $3
      br $for-break0
     end
     local.get $3
     local.get $4
     local.get $5
     call $~lib/typedarray/Uint8Array#__set
     local.get $4
     i32.const 1
     i32.add
     local.set $4
     br $for-loop|0
    end
   end
  end
  local.get $3
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readU64 (param $0 i32) (result i64)
  (local $1 i32)
  (local $2 i32)
  (local $3 i64)
  local.get $0
  local.get $0
  i32.load offset=4
  i32.const 8
  i32.add
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#verifyEnd
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.const 31
  i32.shr_u
  local.get $0
  i32.load
  local.tee $2
  i32.load offset=8
  local.get $1
  i32.const 8
  i32.add
  i32.lt_s
  i32.or
  if
   i32.const 2176
   i32.const 2416
   i32.const 159
   i32.const 7
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $1
  local.get $2
  i32.load offset=4
  i32.add
  i64.load
  call $~lib/polyfills/bswap<u64>
  local.get $0
  local.get $0
  i32.load offset=4
  i32.const 8
  i32.add
  i32.store offset=4
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/types/Address/Address#___set (param $0 i32) (param $1 i32) (param $2 i32)
  local.get $0
  i32.load8_u offset=12
  if
   i32.const 9280
   i32.const 2752
   i32.const 378
   i32.const 13
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $1
  local.get $0
  i32.load offset=8
  i32.ge_u
  if
   i32.const 2176
   i32.const 2752
   i32.const 382
   i32.const 13
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $0
  i32.load offset=4
  local.get $1
  i32.add
  local.get $2
  i32.store8
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readAddress (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  local.get $0
  local.get $0
  i32.load offset=4
  i32.const 32
  i32.add
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#verifyEnd
  i32.const 0
  i32.const 0
  i32.const 0
  i32.const 10
  i32.const 9248
  call $~lib/rt/__newArray
  call $~lib/@btc-vision/btc-runtime/runtime/types/Address/Address#constructor
  local.set $2
  loop $for-loop|0
   local.get $1
   i32.const 32
   i32.lt_s
   if
    local.get $2
    local.get $1
    local.get $0
    call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readU8
    call $~lib/@btc-vision/btc-runtime/runtime/types/Address/Address#___set
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|0
   end
  end
  local.get $2
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#get:chainId (param $0 i32) (result i32)
  local.get $0
  i32.load offset=44
  i32.eqz
  if
   i32.const 9360
   i32.const 5168
   i32.const 249
   i32.const 13
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $0
  i32.load offset=44
  local.tee $0
  i32.eqz
  if
   i32.const 9424
   i32.const 5168
   i32.const 251
   i32.const 16
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $0
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/script/Networks/NetworkManager#equals (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $0
  i32.load offset=8
  local.get $1
  i32.load offset=8
  i32.ne
  if
   i32.const 0
   return
  end
  loop $for-loop|0
   local.get $2
   local.get $0
   i32.load offset=8
   i32.lt_s
   if
    local.get $0
    local.get $2
    call $~lib/typedarray/Uint8Array#__get
    local.get $1
    local.get $2
    call $~lib/typedarray/Uint8Array#__get
    i32.ne
    if
     i32.const 0
     return
    end
    local.get $2
    i32.const 1
    i32.add
    local.set $2
    br $for-loop|0
   end
  end
  i32.const 1
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#setEnvironmentVariables (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i64)
  (local $5 i64)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i64)
  (local $14 i32)
  (local $15 i32)
  (local $16 i32)
  local.get $1
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#constructor
  local.tee $14
  i32.const 32
  i32.const 0
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readBytes
  local.set $1
  local.get $14
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readU64
  local.set $4
  local.get $14
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readU64
  local.set $5
  local.get $14
  i32.const 32
  i32.const 0
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readBytes
  local.set $6
  local.get $14
  i32.const 32
  i32.const 0
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readBytes
  local.set $7
  local.get $14
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readAddress
  local.set $8
  local.get $14
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readAddress
  local.set $9
  local.get $14
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readAddress
  local.set $10
  i32.const 32
  call $~lib/array/Array<u8>#constructor
  local.set $15
  loop $for-loop|0
   local.get $2
   i32.const 32
   i32.lt_s
   if
    local.get $15
    local.get $2
    local.get $14
    call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readU8
    call $~lib/array/Array<u8>#__set
    local.get $2
    i32.const 1
    i32.add
    local.set $2
    br $for-loop|0
   end
  end
  local.get $14
  i32.const 32
  i32.const 0
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readBytes
  local.set $11
  local.get $14
  i32.const 32
  i32.const 0
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readBytes
  local.set $12
  i32.const 32
  call $~lib/array/Array<u8>#constructor
  local.set $16
  i32.const 0
  local.set $2
  loop $for-loop|1
   local.get $2
   i32.const 32
   i32.lt_s
   if
    local.get $16
    local.get $2
    local.get $14
    call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readU8
    call $~lib/array/Array<u8>#__set
    local.get $2
    i32.const 1
    i32.add
    local.set $2
    br $for-loop|1
   end
  end
  local.get $14
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readU64
  local.set $13
  local.get $16
  local.get $15
  call $~lib/@btc-vision/btc-runtime/runtime/types/ExtendedAddress/ExtendedAddress#constructor
  local.set $2
  i32.const 32
  i32.const 26
  call $~lib/rt/stub/__new
  local.tee $14
  local.get $6
  i32.store offset=16
  local.get $14
  local.get $7
  i32.store offset=20
  local.get $14
  i32.const 0
  i32.store
  local.get $14
  i32.const 0
  i32.store offset=4
  local.get $14
  i32.const 0
  i32.store offset=8
  local.get $14
  i32.const 0
  i32.const 28
  call $~lib/rt/stub/__new
  call $~lib/object/Object#constructor
  i32.store offset=12
  local.get $14
  i32.const 0
  i32.store offset=24
  local.get $14
  i32.const 0
  i32.store offset=28
  local.get $14
  local.get $10
  i32.store offset=4
  local.get $14
  local.get $2
  i32.store offset=8
  i32.const 8
  i32.const 27
  call $~lib/rt/stub/__new
  local.tee $2
  i64.const 0
  i64.store
  local.get $2
  local.get $13
  i64.store
  local.get $14
  local.get $2
  i32.store
  local.get $0
  local.get $14
  i32.store offset=24
  local.get $0
  local.get $9
  i32.store offset=36
  local.get $0
  local.get $8
  i32.store offset=40
  local.get $0
  local.get $11
  i32.store offset=44
  local.get $0
  local.get $12
  i32.store offset=48
  global.get $~lib/@btc-vision/btc-runtime/runtime/script/Networks/Network
  local.set $2
  local.get $0
  call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#get:chainId
  local.tee $6
  i32.load offset=8
  i32.const 32
  i32.ne
  if
   i32.const 9552
   i32.const 9632
   i32.const 89
   i32.const 13
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  block $__inlined_func$~lib/@btc-vision/btc-runtime/runtime/script/Networks/NetworkManager#fromChainId$335
   local.get $6
   local.get $2
   i32.load
   call $~lib/@btc-vision/btc-runtime/runtime/script/Networks/NetworkManager#equals
   br_if $__inlined_func$~lib/@btc-vision/btc-runtime/runtime/script/Networks/NetworkManager#fromChainId$335
   i32.const 1
   local.set $3
   local.get $6
   local.get $2
   i32.load offset=4
   call $~lib/@btc-vision/btc-runtime/runtime/script/Networks/NetworkManager#equals
   br_if $__inlined_func$~lib/@btc-vision/btc-runtime/runtime/script/Networks/NetworkManager#fromChainId$335
   i32.const 2
   local.set $3
   local.get $6
   local.get $2
   i32.load offset=12
   call $~lib/@btc-vision/btc-runtime/runtime/script/Networks/NetworkManager#equals
   br_if $__inlined_func$~lib/@btc-vision/btc-runtime/runtime/script/Networks/NetworkManager#fromChainId$335
   i32.const 3
   local.set $3
   local.get $6
   local.get $2
   i32.load offset=8
   call $~lib/@btc-vision/btc-runtime/runtime/script/Networks/NetworkManager#equals
   br_if $__inlined_func$~lib/@btc-vision/btc-runtime/runtime/script/Networks/NetworkManager#fromChainId$335
   i32.const 9776
   i32.const 9632
   i32.const 97
   i32.const 9
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $0
  local.get $3
  i32.store offset=16
  i32.const 24
  i32.const 24
  call $~lib/rt/stub/__new
  local.tee $2
  local.get $1
  i32.store offset=4
  local.get $2
  local.get $4
  i64.store offset=8
  local.get $2
  local.get $5
  i64.store offset=16
  local.get $2
  i32.const 0
  i32.store
  local.get $2
  block $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256.fromU64|inlined.2 (result i32)
   local.get $4
   i64.eqz
   if
    i64.const 0
    i64.const 0
    i64.const 0
    i64.const 0
    call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#constructor
    br $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256.fromU64|inlined.2
   end
   local.get $4
   i64.const 1
   i64.eq
   if
    i64.const 1
    i64.const 0
    i64.const 0
    i64.const 0
    call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#constructor
    br $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256.fromU64|inlined.2
   end
   local.get $4
   i64.const 0
   i64.const 0
   i64.const 0
   call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#constructor
  end
  i32.store
  local.get $0
  local.get $2
  i32.store offset=20
  local.get $0
  call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#createContractIfNotExists
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readU32 (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  local.get $0
  local.get $0
  i32.load offset=4
  i32.const 4
  i32.add
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#verifyEnd
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.const 31
  i32.shr_u
  local.get $0
  i32.load
  local.tee $2
  i32.load offset=8
  local.get $1
  i32.const 4
  i32.add
  i32.lt_s
  i32.or
  if
   i32.const 2176
   i32.const 2416
   i32.const 87
   i32.const 7
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $1
  local.get $2
  i32.load offset=4
  i32.add
  i32.load
  call $~lib/polyfills/bswap<u32>
  local.get $0
  local.get $0
  i32.load offset=4
  i32.const 4
  i32.add
  i32.store offset=4
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#get:contract (param $0 i32) (result i32)
  local.get $0
  i32.load offset=12
  local.tee $0
  i32.eqz
  if
   i32.const 9424
   i32.const 5168
   i32.const 158
   i32.const 16
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $0
 )
 (func $~lib/array/Array<~lib/@btc-vision/btc-runtime/runtime/plugins/Plugin/Plugin>#__get (param $0 i32) (param $1 i32) (result i32)
  local.get $1
  local.get $0
  i32.load offset=12
  i32.ge_u
  if
   i32.const 2176
   i32.const 4192
   i32.const 116
   i32.const 42
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $0
  i32.load offset=4
  local.get $1
  i32.const 2
  i32.shl
  i32.add
  i32.load
  local.tee $0
  i32.eqz
  if
   i32.const 9840
   i32.const 4192
   i32.const 120
   i32.const 40
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $0
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/contracts/OP_NET/OP_NET#onExecutionStarted (param $0 i32)
  (local $1 i32)
  loop $for-loop|0
   local.get $1
   local.get $0
   i32.load
   i32.load offset=12
   i32.lt_s
   if
    local.get $0
    i32.load
    local.get $1
    call $~lib/array/Array<~lib/@btc-vision/btc-runtime/runtime/plugins/Plugin/Plugin>#__get
    drop
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|0
   end
  end
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#onExecutionStarted (param $0 i32) (param $1 i32)
  (local $2 i32)
  block $__inlined_func$~lib/@btc-vision/btc-runtime/runtime/contracts/OP_NET/OP_NET#onExecutionStarted@override$399
   local.get $0
   call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#get:contract
   local.tee $0
   i32.const 8
   i32.sub
   i32.load
   local.tee $2
   i32.const 37
   i32.eq
   local.get $2
   i32.const 36
   i32.eq
   i32.or
   local.get $2
   i32.const 35
   i32.eq
   i32.or
   if
    local.get $0
    call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP_NET/OP_NET#onExecutionStarted
    local.get $0
    local.get $1
    call $~lib/@btc-vision/btc-runtime/runtime/contracts/ReentrancyGuard/ReentrancyGuard#isSelectorExcluded@override
    i32.eqz
    if
     local.get $0
     call $~lib/@btc-vision/btc-runtime/runtime/contracts/ReentrancyGuard/ReentrancyGuard#nonReentrantBefore
    end
    br $__inlined_func$~lib/@btc-vision/btc-runtime/runtime/contracts/OP_NET/OP_NET#onExecutionStarted@override$399
   end
   local.get $0
   call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP_NET/OP_NET#onExecutionStarted
  end
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/env/global/sha256 (param $0 i32) (result i32)
  (local $1 i32)
  i32.const 32
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.set $1
  local.get $0
  i32.load
  local.get $0
  i32.load offset=8
  local.get $1
  call $~lib/@btc-vision/btc-runtime/runtime/env/global/_sha256
  i32.const 1
  global.set $~argumentsLength
  local.get $1
  call $~lib/typedarray/Uint8Array.wrap@varargs
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#constructor (param $0 i32) (result i32)
  (local $1 i32)
  i32.const 12
  i32.const 60
  call $~lib/rt/stub/__new
  local.tee $1
  i32.const 0
  i32.store
  local.get $1
  i32.const 0
  i32.store offset=4
  local.get $1
  i32.const 0
  i32.store offset=8
  local.get $1
  i32.const 0
  local.get $0
  call $~lib/typedarray/Uint8Array#constructor
  local.tee $0
  i32.store offset=8
  local.get $0
  i32.load
  local.set $0
  i32.const 1
  global.set $~argumentsLength
  local.get $1
  local.get $0
  call $~lib/dataview/DataView#constructor@varargs
  i32.store offset=4
  local.get $1
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#get:contractDeployer (param $0 i32) (result i32)
  local.get $0
  i32.load offset=36
  i32.eqz
  if
   i32.const 10256
   i32.const 5168
   i32.const 208
   i32.const 13
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $0
  i32.load offset=36
  local.tee $0
  i32.eqz
  if
   i32.const 9424
   i32.const 5168
   i32.const 210
   i32.const 16
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $0
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#allocSafe (param $0 i32) (param $1 i32)
  (local $2 i32)
  local.get $1
  i32.const -1
  local.get $0
  i32.load
  i32.sub
  i32.gt_u
  if
   i32.const 10640
   i32.const 10496
   i32.const 480
   i32.const 13
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $0
  i32.load offset=4
  i32.load offset=8
  local.tee $2
  local.get $1
  local.get $0
  i32.load
  i32.add
  local.tee $1
  i32.lt_u
  if
   i32.const 10960
   i32.const 1
   local.get $1
   local.get $2
   i32.sub
   local.get $2
   i32.add
   call $~lib/number/I32#toString
   call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
   i32.const 10720
   i32.const 10960
   call $~lib/staticarray/StaticArray<~lib/string/String>#join
   call $~lib/string/String#concat
   i32.const 10992
   local.get $0
   i32.load offset=4
   i32.load offset=8
   call $~lib/number/I32#toString
   call $~lib/string/String#concat
   call $~lib/string/String#concat
   i32.const 10496
   i32.const 505
   i32.const 9
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeU8 (param $0 i32) (param $1 i32)
  local.get $0
  i32.const 1
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#allocSafe
  local.get $0
  i32.load offset=4
  local.get $0
  i32.load
  local.get $1
  call $~lib/dataview/DataView#setUint8
  local.get $0
  local.get $0
  i32.load
  i32.const 1
  i32.add
  i32.store
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeBytes (param $0 i32) (param $1 i32)
  (local $2 i32)
  local.get $0
  local.get $1
  i32.load offset=8
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#allocSafe
  loop $for-loop|0
   local.get $2
   local.get $1
   i32.load offset=8
   i32.lt_s
   if
    local.get $0
    local.get $1
    local.get $2
    call $~lib/typedarray/Uint8Array#__get
    call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeU8
    local.get $2
    i32.const 1
    i32.add
    local.set $2
    br $for-loop|0
   end
  end
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeAddress (param $0 i32) (param $1 i32)
  local.get $1
  i32.load offset=8
  i32.const 32
  i32.gt_s
  if
   local.get $1
   i32.load offset=8
   call $~lib/number/I32#toString
   local.set $0
   i32.const 32
   call $~lib/number/I32#toString
   local.set $1
   i32.const 10448
   i32.const 1
   local.get $0
   call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
   i32.const 10448
   i32.const 3
   local.get $1
   call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
   i32.const 10448
   call $~lib/staticarray/StaticArray<~lib/string/String>#join
   i32.const 10496
   i32.const 492
   i32.const 13
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $0
  local.get $1
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeBytes
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/contracts/OP_NET/OP_NET#execute (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  i32.const 1
  global.set $~argumentsLength
  i32.const 9968
  call $~lib/string/String.UTF8.encode@varargs
  i32.const 1
  global.set $~argumentsLength
  call $~lib/typedarray/Uint8Array.wrap@varargs
  call $~lib/@btc-vision/btc-runtime/runtime/env/global/sha256
  local.tee $4
  i32.load offset=8
  i32.const 4
  i32.lt_s
  if
   i32.const 10016
   i32.const 10128
   i32.const 12
   i32.const 9
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $1
  local.get $4
  i32.const 0
  call $~lib/typedarray/Uint8Array#__get
  i32.const 24
  i32.shl
  local.get $4
  i32.const 1
  call $~lib/typedarray/Uint8Array#__get
  i32.const 16
  i32.shl
  i32.or
  local.get $4
  i32.const 2
  call $~lib/typedarray/Uint8Array#__get
  i32.const 8
  i32.shl
  i32.or
  local.get $4
  i32.const 3
  call $~lib/typedarray/Uint8Array#__get
  i32.or
  i32.eq
  if
   i32.const 32
   call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#constructor
   local.tee $0
   global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
   call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#get:contractDeployer
   call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeAddress
   local.get $0
   return
  end
  local.get $2
  i32.load offset=4
  local.set $4
  loop $for-loop|1
   local.get $3
   local.get $0
   i32.load
   i32.load offset=12
   i32.lt_s
   if
    local.get $0
    i32.load
    local.get $3
    call $~lib/array/Array<~lib/@btc-vision/btc-runtime/runtime/plugins/Plugin/Plugin>#__get
    i32.const 8
    i32.sub
    i32.load
    drop
    local.get $2
    local.get $4
    call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#verifyEnd
    local.get $2
    local.get $4
    i32.store offset=4
    local.get $3
    i32.const 1
    i32.add
    local.set $3
    br $for-loop|1
   end
  end
  i32.const 11040
  local.get $1
  call $~lib/number/U32#toString
  call $~lib/string/String#concat
  i32.const 11104
  i32.const 92
  i32.const 9
  call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
  unreachable
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#onExecutionCompleted (param $0 i32) (param $1 i32)
  (local $2 i32)
  block $__inlined_func$~lib/@btc-vision/btc-runtime/runtime/contracts/OP_NET/OP_NET#onExecutionCompleted@override$433
   local.get $0
   call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#get:contract
   local.tee $0
   i32.const 8
   i32.sub
   i32.load
   local.tee $2
   i32.const 37
   i32.eq
   local.get $2
   i32.const 36
   i32.eq
   i32.or
   local.get $2
   i32.const 35
   i32.eq
   i32.or
   if
    local.get $0
    call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP_NET/OP_NET#onExecutionStarted
    local.get $0
    local.get $1
    call $~lib/@btc-vision/btc-runtime/runtime/contracts/ReentrancyGuard/ReentrancyGuard#isSelectorExcluded@override
    i32.eqz
    if
     local.get $0
     i32.load offset=12
     if
      local.get $0
      i32.load offset=12
      i32.const 1
      i32.eq
      if
       local.get $0
       i32.load offset=8
       call $~lib/@btc-vision/btc-runtime/runtime/storage/StoredU256/StoredU256#get:value
       local.tee $1
       i64.load offset=24
       local.get $1
       i64.load offset=16
       local.get $1
       i64.load
       local.get $1
       i64.load offset=8
       i64.or
       i64.or
       i64.or
       i64.eqz
       if
        i32.const 20944
        i32.const 11648
        i32.const 98
        i32.const 17
        call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
        unreachable
       end
       local.get $1
       i64.const 1
       i64.const 0
       i64.const 0
       i64.const 0
       call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#constructor
       call $~lib/@btc-vision/btc-runtime/runtime/types/SafeMath/SafeMath.sub
       local.set $1
       local.get $0
       i32.load offset=8
       local.get $1
       call $~lib/@btc-vision/btc-runtime/runtime/storage/StoredU256/StoredU256#set:value
       local.get $1
       i64.load offset=24
       local.get $1
       i64.load offset=16
       local.get $1
       i64.load
       local.get $1
       i64.load offset=8
       i64.or
       i64.or
       i64.or
       i64.eqz
       if
        local.get $0
        i32.load offset=4
        i32.const 0
        call $~lib/@btc-vision/btc-runtime/runtime/storage/StoredBoolean/StoredBoolean#set:value
       end
      end
     else
      local.get $0
      i32.load offset=4
      i32.const 0
      call $~lib/@btc-vision/btc-runtime/runtime/storage/StoredBoolean/StoredBoolean#set:value
     end
    end
    br $__inlined_func$~lib/@btc-vision/btc-runtime/runtime/contracts/OP_NET/OP_NET#onExecutionCompleted@override$433
   end
   local.get $0
   call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP_NET/OP_NET#onExecutionStarted
  end
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/exports/index/execute (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  i32.const 0
  i32.const 512
  i32.const 512
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.tee $1
  call $~lib/@btc-vision/btc-runtime/runtime/env/global/getEnvironmentVariables
  i32.const 1
  global.set $~argumentsLength
  global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
  local.get $1
  call $~lib/typedarray/Uint8Array.wrap@varargs
  call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#setEnvironmentVariables
  i32.const 0
  local.get $0
  local.get $0
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.tee $0
  call $~lib/@btc-vision/btc-runtime/runtime/env/global/getCalldata
  i32.const 1
  global.set $~argumentsLength
  local.get $0
  call $~lib/typedarray/Uint8Array.wrap@varargs
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#constructor
  local.tee $2
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readU32
  local.set $0
  global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
  local.get $0
  call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#onExecutionStarted
  block $__inlined_func$~lib/@btc-vision/btc-runtime/runtime/contracts/OP_NET/OP_NET#execute@override$435 (result i32)
   block $default
    block $case1
     global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
     call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#get:contract
     local.tee $1
     i32.const 8
     i32.sub
     i32.load
     local.tee $3
     i32.const 35
     i32.ne
     if
      local.get $3
      i32.const 36
      i32.eq
      br_if $case1
      br $default
     end
     local.get $1
     local.get $0
     local.get $2
     call $op721/DopamilioNFT/DopamilioNFT#execute
     br $__inlined_func$~lib/@btc-vision/btc-runtime/runtime/contracts/OP_NET/OP_NET#execute@override$435
    end
    local.get $1
    local.get $0
    local.get $2
    call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#execute
    br $__inlined_func$~lib/@btc-vision/btc-runtime/runtime/contracts/OP_NET/OP_NET#execute@override$435
   end
   local.get $1
   local.get $0
   local.get $2
   call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP_NET/OP_NET#execute
  end
  global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
  local.get $0
  call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#onExecutionCompleted
  i32.load offset=8
  i32.load
  local.tee $0
  call $~lib/arraybuffer/ArrayBuffer#get:byteLength
  local.tee $1
  i32.const 0
  i32.gt_s
  if
   i32.const 0
   local.get $0
   local.get $1
   call $~lib/@btc-vision/btc-runtime/runtime/env/global/env_exit
  end
  i32.const 0
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/exports/index/onDeploy (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  i32.const 0
  i32.const 512
  i32.const 512
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.tee $1
  call $~lib/@btc-vision/btc-runtime/runtime/env/global/getEnvironmentVariables
  i32.const 1
  global.set $~argumentsLength
  global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
  local.get $1
  call $~lib/typedarray/Uint8Array.wrap@varargs
  call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#setEnvironmentVariables
  i32.const 0
  local.get $0
  local.get $0
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.tee $0
  call $~lib/@btc-vision/btc-runtime/runtime/env/global/getCalldata
  i32.const 1
  global.set $~argumentsLength
  local.get $0
  call $~lib/typedarray/Uint8Array.wrap@varargs
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#constructor
  drop
  global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
  i32.const 0
  call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#onExecutionStarted
  block $__inlined_func$~lib/@btc-vision/btc-runtime/runtime/contracts/OP_NET/OP_NET#onDeployment@override$440
   global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
   call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#get:contract
   local.tee $1
   i32.const 8
   i32.sub
   i32.load
   i32.const 35
   i32.eq
   if
    global.get $op721/DopamilioNFT/MAX_SUPPLY
    local.set $2
    i32.const 32
    i32.const 72
    call $~lib/rt/stub/__new
    local.tee $0
    i32.const 0
    i32.store
    local.get $0
    i32.const 0
    i32.store offset=4
    local.get $0
    i32.const 0
    i32.store offset=8
    local.get $0
    i32.const 0
    i32.store offset=12
    local.get $0
    i32.const 0
    i32.store offset=16
    local.get $0
    i32.const 0
    i32.store offset=20
    local.get $0
    i32.const 0
    i32.store offset=24
    local.get $0
    i32.const 0
    i32.store offset=28
    local.get $0
    i32.const 21040
    i32.store
    local.get $0
    i32.const 21088
    i32.store offset=4
    local.get $0
    i32.const 7136
    i32.store offset=8
    local.get $0
    local.get $2
    i32.store offset=12
    local.get $0
    i32.const 7312
    i32.store offset=16
    local.get $0
    i32.const 7232
    i32.store offset=20
    local.get $0
    i32.const 7408
    i32.store offset=24
    local.get $0
    i32.const 7472
    i32.store offset=28
    local.get $1
    local.get $0
    call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#instantiate
    local.get $1
    call $op721/DopamilioNFT/DopamilioNFT#get:_mintPrice
    i64.const 6969
    i64.const 0
    i64.const 0
    i64.const 0
    call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#constructor
    call $~lib/@btc-vision/btc-runtime/runtime/storage/StoredU256/StoredU256#set:value
    local.get $1
    call $op721/DopamilioNFT/DopamilioNFT#get:_treasury
    i32.const 7648
    call $~lib/@btc-vision/btc-runtime/runtime/storage/BaseStoredString/BaseStoredString#set:value
    br $__inlined_func$~lib/@btc-vision/btc-runtime/runtime/contracts/OP_NET/OP_NET#onDeployment@override$440
   end
   local.get $1
   call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP_NET/OP_NET#onExecutionStarted
  end
  global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
  i32.const 0
  call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#onExecutionCompleted
  i32.const 0
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/exports/index/onUpdate (param $0 i32) (result i32)
  (local $1 i32)
  i32.const 0
  i32.const 512
  i32.const 512
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.tee $1
  call $~lib/@btc-vision/btc-runtime/runtime/env/global/getEnvironmentVariables
  i32.const 1
  global.set $~argumentsLength
  global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
  local.get $1
  call $~lib/typedarray/Uint8Array.wrap@varargs
  call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#setEnvironmentVariables
  i32.const 0
  local.get $0
  local.get $0
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.tee $0
  call $~lib/@btc-vision/btc-runtime/runtime/env/global/getCalldata
  i32.const 1
  global.set $~argumentsLength
  local.get $0
  call $~lib/typedarray/Uint8Array.wrap@varargs
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#constructor
  drop
  global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
  i32.const 0
  call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#onExecutionStarted
  global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
  call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#get:contract
  local.tee $0
  i32.const 8
  i32.sub
  i32.load
  i32.const 35
  i32.ne
  if
   local.get $0
   call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP_NET/OP_NET#onExecutionStarted
  end
  global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
  i32.const 0
  call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#onExecutionCompleted
  i32.const 0
 )
 (func $~lib/array/Array<~lib/typedarray/Uint8Array>#__uget (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  i32.load offset=4
  local.get $1
  i32.const 2
  i32.shl
  i32.add
  i32.load
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/generic/MapUint8Array/MapUint8Array#indexOf (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i64)
  (local $9 i32)
  (local $10 i32)
  block $__inlined_func$~lib/@btc-vision/btc-runtime/runtime/generic/MapUint8Array/MapUint8Array#isLastIndex$5 (result i32)
   local.get $0
   i32.load offset=8
   i32.const -1
   i32.ne
   if
    local.get $0
    i32.load
    local.get $0
    i32.load offset=8
    call $~lib/array/Array<~lib/typedarray/Uint8Array>#__uget
    local.tee $4
    i32.load offset=8
    local.get $1
    i32.load offset=8
    i32.eq
    if
     local.get $1
     i32.load offset=8
     local.set $2
     block $~lib/util/memory/memcmp|inlined.0
      local.get $4
      i32.load offset=4
      local.tee $4
      local.get $1
      i32.load offset=4
      local.tee $5
      i32.eq
      br_if $~lib/util/memory/memcmp|inlined.0
      loop $while-continue|0
       local.get $2
       local.tee $3
       i32.const 1
       i32.sub
       local.set $2
       local.get $3
       if
        local.get $4
        i32.load8_u
        local.tee $6
        local.get $5
        i32.load8_u
        local.tee $7
        i32.sub
        local.set $3
        local.get $6
        local.get $7
        i32.ne
        br_if $~lib/util/memory/memcmp|inlined.0
        local.get $4
        i32.const 1
        i32.add
        local.set $4
        local.get $5
        i32.const 1
        i32.add
        local.set $5
        br $while-continue|0
       end
      end
      i32.const 0
      local.set $3
     end
     i32.const 1
     local.get $3
     i32.eqz
     br_if $__inlined_func$~lib/@btc-vision/btc-runtime/runtime/generic/MapUint8Array/MapUint8Array#isLastIndex$5
     drop
    end
   end
   i32.const 0
  end
  if
   local.get $0
   i32.load offset=8
   return
  end
  local.get $0
  i32.load
  i32.load offset=12
  local.tee $2
  i32.eqz
  if
   i32.const -1
   return
  end
  local.get $1
  i32.load offset=4
  local.set $3
  local.get $1
  i32.load offset=8
  local.tee $4
  i32.const 8
  i32.ge_s
  if
   local.get $3
   i64.load
   local.set $8
   local.get $2
   i32.const 1
   i32.sub
   local.set $6
   loop $for-loop|0
    local.get $6
    i32.const 0
    i32.ge_s
    if
     block $for-continue|0
      local.get $4
      local.get $0
      i32.load
      local.get $6
      call $~lib/array/Array<~lib/typedarray/Uint8Array>#__uget
      local.tee $2
      i32.load offset=8
      i32.ne
      br_if $for-continue|0
      local.get $2
      i32.load offset=4
      i64.load
      local.get $8
      i64.ne
      br_if $for-continue|0
      local.get $4
      local.set $1
      i32.const 0
      local.set $5
      block $~lib/util/memory/memcmp|inlined.1
       local.get $2
       i32.load offset=4
       local.tee $7
       local.get $3
       local.tee $2
       i32.eq
       br_if $~lib/util/memory/memcmp|inlined.1
       loop $while-continue|1
        local.get $1
        local.tee $5
        i32.const 1
        i32.sub
        local.set $1
        local.get $5
        if
         local.get $7
         i32.load8_u
         local.tee $9
         local.get $2
         i32.load8_u
         local.tee $10
         i32.sub
         local.set $5
         local.get $9
         local.get $10
         i32.ne
         br_if $~lib/util/memory/memcmp|inlined.1
         local.get $7
         i32.const 1
         i32.add
         local.set $7
         local.get $2
         i32.const 1
         i32.add
         local.set $2
         br $while-continue|1
        end
       end
       i32.const 0
       local.set $5
      end
      local.get $5
      i32.eqz
      if
       local.get $0
       local.get $6
       i32.store offset=8
       local.get $6
       return
      end
     end
     local.get $6
     i32.const 1
     i32.sub
     local.set $6
     br $for-loop|0
    end
   end
  else
   local.get $2
   i32.const 1
   i32.sub
   local.set $6
   loop $for-loop|2
    local.get $6
    i32.const 0
    i32.ge_s
    if
     local.get $0
     i32.load
     local.get $6
     call $~lib/array/Array<~lib/typedarray/Uint8Array>#__uget
     local.tee $2
     i32.load offset=8
     local.get $4
     i32.eq
     if
      local.get $4
      local.set $1
      i32.const 0
      local.set $5
      block $~lib/util/memory/memcmp|inlined.2
       local.get $2
       i32.load offset=4
       local.tee $7
       local.get $3
       local.tee $2
       i32.eq
       br_if $~lib/util/memory/memcmp|inlined.2
       loop $while-continue|3
        local.get $1
        local.tee $5
        i32.const 1
        i32.sub
        local.set $1
        local.get $5
        if
         local.get $7
         i32.load8_u
         local.tee $9
         local.get $2
         i32.load8_u
         local.tee $10
         i32.sub
         local.set $5
         local.get $9
         local.get $10
         i32.ne
         br_if $~lib/util/memory/memcmp|inlined.2
         local.get $7
         i32.const 1
         i32.add
         local.set $7
         local.get $2
         i32.const 1
         i32.add
         local.set $2
         br $while-continue|3
        end
       end
       i32.const 0
       local.set $5
      end
      local.get $5
      i32.eqz
      if
       local.get $0
       local.get $6
       i32.store offset=8
       local.get $6
       return
      end
     end
     local.get $6
     i32.const 1
     i32.sub
     local.set $6
     br $for-loop|2
    end
   end
  end
  i32.const -1
 )
 (func $~lib/array/Array<~lib/typedarray/Uint8Array>#push (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  local.get $0
  local.get $0
  i32.load offset=12
  local.tee $2
  i32.const 1
  i32.add
  local.tee $3
  i32.const 2
  i32.const 1
  call $~lib/array/ensureCapacity
  local.get $0
  i32.load offset=4
  local.get $2
  i32.const 2
  i32.shl
  i32.add
  local.get $1
  i32.store
  local.get $0
  local.get $3
  i32.store offset=12
 )
 (func $~lib/array/Array<~lib/typedarray/Uint8Array>#__set (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  local.get $1
  local.get $0
  i32.load offset=12
  i32.ge_u
  if
   local.get $1
   i32.const 0
   i32.lt_s
   if
    i32.const 2176
    i32.const 4192
    i32.const 132
    i32.const 22
    call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
    unreachable
   end
   local.get $0
   local.get $1
   i32.const 1
   i32.add
   local.tee $3
   i32.const 2
   i32.const 1
   call $~lib/array/ensureCapacity
   local.get $0
   local.get $3
   i32.store offset=12
  end
  local.get $0
  i32.load offset=4
  local.get $1
  i32.const 2
  i32.shl
  i32.add
  local.get $2
  i32.store
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/generic/MapUint8Array/MapUint8Array#set (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  local.get $0
  local.get $1
  call $~lib/@btc-vision/btc-runtime/runtime/generic/MapUint8Array/MapUint8Array#indexOf
  local.tee $3
  i32.const -1
  i32.eq
  if
   local.get $0
   i32.load
   local.get $1
   call $~lib/array/Array<~lib/typedarray/Uint8Array>#push
   local.get $0
   i32.load offset=4
   local.get $2
   call $~lib/array/Array<~lib/typedarray/Uint8Array>#push
   local.get $0
   local.get $0
   i32.load
   i32.load offset=12
   i32.const 1
   i32.sub
   i32.store offset=8
  else
   local.get $0
   i32.load offset=4
   local.get $3
   local.get $2
   call $~lib/array/Array<~lib/typedarray/Uint8Array>#__set
   local.get $0
   local.get $3
   i32.store offset=8
  end
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#hasPointerStorageHash (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  local.get $1
  i32.load
  call $~lib/arraybuffer/ArrayBuffer#get:byteLength
  i32.const 32
  i32.ne
  if
   i32.const 11248
   i32.const 5168
   i32.const 1361
   i32.const 13
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $0
  i32.load offset=4
  local.get $1
  call $~lib/@btc-vision/btc-runtime/runtime/generic/MapUint8Array/MapUint8Array#indexOf
  i32.const -1
  i32.ne
  if
   return
  end
  i32.const 32
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.set $2
  local.get $1
  i32.load
  local.get $2
  call $~lib/@btc-vision/btc-runtime/runtime/env/global/loadPointer
  i32.const 1
  global.set $~argumentsLength
  local.get $2
  call $~lib/typedarray/Uint8Array.wrap@varargs
  local.set $2
  local.get $0
  i32.load offset=4
  local.get $1
  local.get $2
  call $~lib/@btc-vision/btc-runtime/runtime/generic/MapUint8Array/MapUint8Array#set
  local.get $2
  i32.load offset=8
  global.get $~lib/@btc-vision/btc-runtime/runtime/math/bytes/EMPTY_BUFFER
  local.tee $1
  i32.load offset=8
  i32.eq
  if
   local.get $2
   i32.load offset=8
   local.set $0
   block $~lib/util/memory/memcmp|inlined.3
    local.get $1
    i32.load offset=4
    local.tee $3
    local.get $2
    i32.load offset=4
    local.tee $2
    i32.eq
    br_if $~lib/util/memory/memcmp|inlined.3
    loop $while-continue|0
     local.get $0
     local.tee $1
     i32.const 1
     i32.sub
     local.set $0
     local.get $1
     if
      local.get $3
      i32.load8_u
      local.get $2
      i32.load8_u
      i32.ne
      br_if $~lib/util/memory/memcmp|inlined.3
      local.get $2
      i32.const 1
      i32.add
      local.set $2
      local.get $3
      i32.const 1
      i32.add
      local.set $3
      br $while-continue|0
     end
    end
   end
  end
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#getStorageAt (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  local.get $1
  call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#hasPointerStorageHash
  local.get $0
  i32.load offset=4
  local.get $1
  call $~lib/@btc-vision/btc-runtime/runtime/generic/MapUint8Array/MapUint8Array#indexOf
  i32.const -1
  i32.ne
  if
   local.get $0
   i32.load offset=4
   local.tee $0
   local.get $1
   call $~lib/@btc-vision/btc-runtime/runtime/generic/MapUint8Array/MapUint8Array#indexOf
   local.tee $1
   i32.const -1
   i32.eq
   if
    i32.const 11328
    i32.const 11424
    i32.const 118
    i32.const 13
    call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
    unreachable
   end
   local.get $0
   i32.load offset=4
   local.get $1
   call $~lib/array/Array<~lib/typedarray/Uint8Array>#__uget
   return
  end
  i32.const 0
  i32.const 32
  call $~lib/typedarray/Uint8Array#constructor
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#_internalSetStorageAt (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  local.get $1
  i32.load offset=8
  i32.const 32
  i32.ne
  if
   i32.const 11248
   i32.const 5168
   i32.const 1334
   i32.const 13
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $2
  local.set $3
  local.get $2
  i32.load offset=8
  i32.const 32
  i32.ne
  if
   i32.const 0
   i32.const 32
   call $~lib/typedarray/Uint8Array#constructor
   local.tee $3
   i32.load offset=4
   local.get $2
   i32.load offset=4
   local.get $2
   i32.load offset=8
   i32.const 32
   i32.lt_s
   if (result i32)
    local.get $2
    i32.load offset=8
   else
    i32.const 32
   end
   memory.copy
  end
  local.get $0
  i32.load offset=4
  local.get $1
  local.get $3
  call $~lib/@btc-vision/btc-runtime/runtime/generic/MapUint8Array/MapUint8Array#set
  local.get $1
  i32.load
  local.get $3
  i32.load
  call $~lib/@btc-vision/btc-runtime/runtime/env/global/storePointer
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/storage/StoredBoolean/StoredBoolean#set:value (param $0 i32) (param $1 i32)
  local.get $0
  i32.load offset=8
  i32.const 0
  local.get $1
  i32.eqz
  i32.eqz
  call $~lib/typedarray/Uint8Array#__set
  local.get $0
  i32.load offset=8
  i32.const 1
  i32.const 1
  call $~lib/typedarray/Uint8Array#__set
  local.get $0
  i32.const 1
  i32.store8 offset=5
  global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
  local.get $0
  i32.load
  local.get $0
  i32.load offset=8
  call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#_internalSetStorageAt
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/storage/StoredU256/StoredU256#get:value (param $0 i32) (result i32)
  (local $1 i32)
  global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
  local.get $0
  i32.load
  call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#getStorageAt
  local.tee $1
  i32.load offset=8
  i32.const 32
  i32.ne
  if
   i32.const 2304
   i32.const 5664
   i32.const 220
   i32.const 30
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $0
  local.get $1
  i32.load offset=4
  local.tee $1
  i64.load offset=24
  call $~lib/polyfills/bswap<u64>
  local.get $1
  i64.load offset=16
  call $~lib/polyfills/bswap<u64>
  local.get $1
  i64.load offset=8
  call $~lib/polyfills/bswap<u64>
  local.get $1
  i64.load
  call $~lib/polyfills/bswap<u64>
  call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#constructor
  i32.store offset=12
  local.get $0
  i32.load offset=12
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/types/SafeMath/SafeMath.add (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  local.get $1
  call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256.add
  local.tee $1
  local.get $0
  call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256.lt
  if
   i32.const 11904
   i32.const 8464
   i32.const 55
   i32.const 13
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $1
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/storage/StoredU256/StoredU256#set:value (param $0 i32) (param $1 i32)
  (local $2 i32)
  local.get $0
  local.get $1
  i32.store offset=12
  global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
  local.get $0
  i32.load
  local.get $0
  i32.load offset=12
  local.set $1
  i32.const 0
  i32.const 32
  call $~lib/typedarray/Uint8Array#constructor
  local.tee $2
  i32.load offset=4
  local.tee $0
  local.get $1
  i64.load offset=24
  call $~lib/polyfills/bswap<u64>
  i64.store
  local.get $0
  local.get $1
  i64.load offset=16
  call $~lib/polyfills/bswap<u64>
  i64.store offset=8
  local.get $0
  local.get $1
  i64.load offset=8
  call $~lib/polyfills/bswap<u64>
  i64.store offset=16
  local.get $0
  local.get $1
  i64.load
  call $~lib/polyfills/bswap<u64>
  i64.store offset=24
  local.get $2
  call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#_internalSetStorageAt
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/contracts/ReentrancyGuard/ReentrancyGuard#nonReentrantBefore (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  local.get $0
  i32.load offset=12
  if
   local.get $0
   i32.load offset=12
   i32.const 1
   i32.eq
   if
    local.get $0
    i32.load offset=8
    call $~lib/@btc-vision/btc-runtime/runtime/storage/StoredU256/StoredU256#get:value
    local.tee $1
    i64.const 1
    i64.const 0
    i64.const 0
    i64.const 0
    call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#constructor
    call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256.lt
    i32.eqz
    if
     i32.const 11808
     i32.const 11648
     i32.const 78
     i32.const 17
     call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
     unreachable
    end
    local.get $0
    i32.load offset=8
    local.get $1
    i64.const 1
    i64.const 0
    i64.const 0
    i64.const 0
    call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#constructor
    call $~lib/@btc-vision/btc-runtime/runtime/types/SafeMath/SafeMath.add
    call $~lib/@btc-vision/btc-runtime/runtime/storage/StoredU256/StoredU256#set:value
    local.get $1
    i64.load offset=24
    local.get $1
    i64.load offset=16
    local.get $1
    i64.load
    local.get $1
    i64.load offset=8
    i64.or
    i64.or
    i64.or
    i64.eqz
    if
     local.get $0
     i32.load offset=4
     i32.const 1
     call $~lib/@btc-vision/btc-runtime/runtime/storage/StoredBoolean/StoredBoolean#set:value
    end
   end
  else
   local.get $0
   i32.load offset=4
   local.tee $1
   i32.load8_u offset=5
   i32.eqz
   if
    global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
    local.get $1
    i32.load
    call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#getStorageAt
    local.tee $2
    i32.const 1
    call $~lib/typedarray/Uint8Array#__get
    if
     local.get $1
     local.get $2
     i32.store offset=8
    else
     local.get $1
     i32.load offset=8
     i32.const 0
     local.get $1
     i32.load8_u offset=4
     i32.eqz
     i32.eqz
     call $~lib/typedarray/Uint8Array#__set
     local.get $1
     i32.load offset=8
     i32.const 1
     i32.const 1
     call $~lib/typedarray/Uint8Array#__set
     global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
     local.get $1
     i32.load
     local.get $1
     i32.load offset=8
     call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#_internalSetStorageAt
    end
    local.get $1
    i32.const 1
    i32.store8 offset=5
   end
   local.get $1
   i32.load offset=8
   i32.const 0
   call $~lib/typedarray/Uint8Array#__get
   i32.const 1
   i32.eq
   if
    i32.const 11568
    i32.const 11648
    i32.const 123
    i32.const 9
    call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
    unreachable
   end
   local.get $0
   i32.load offset=4
   i32.const 1
   call $~lib/@btc-vision/btc-runtime/runtime/storage/StoredBoolean/StoredBoolean#set:value
  end
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readU256 (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  local.get $0
  local.get $0
  i32.load offset=4
  i32.const 32
  i32.add
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#verifyEnd
  i32.const 32
  call $~lib/array/Array<u8>#constructor
  local.set $1
  loop $for-loop|0
   local.get $2
   i32.const 32
   i32.lt_s
   if
    local.get $1
    local.get $2
    local.get $0
    call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readU8
    call $~lib/array/Array<u8>#__set
    local.get $2
    i32.const 1
    i32.add
    local.set $2
    br $for-loop|0
   end
  end
  local.get $1
  i32.load offset=12
  i32.const 32
  i32.ne
  if
   i32.const 2304
   i32.const 5664
   i32.const 186
   i32.const 30
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $1
  i32.load offset=4
  local.tee $0
  i64.load offset=24
  call $~lib/polyfills/bswap<u64>
  local.get $0
  i64.load offset=16
  call $~lib/polyfills/bswap<u64>
  local.get $0
  i64.load offset=8
  call $~lib/polyfills/bswap<u64>
  local.get $0
  i64.load
  call $~lib/polyfills/bswap<u64>
  call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#constructor
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeU256 (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  local.get $0
  i32.const 32
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#allocSafe
  i32.const 0
  i32.const 32
  call $~lib/typedarray/Uint8Array#constructor
  local.tee $3
  i32.load offset=4
  local.tee $2
  local.get $1
  i64.load offset=24
  call $~lib/polyfills/bswap<u64>
  i64.store
  local.get $2
  local.get $1
  i64.load offset=16
  call $~lib/polyfills/bswap<u64>
  i64.store offset=8
  local.get $2
  local.get $1
  i64.load offset=8
  call $~lib/polyfills/bswap<u64>
  i64.store offset=16
  local.get $2
  local.get $1
  i64.load
  call $~lib/polyfills/bswap<u64>
  i64.store offset=24
  i32.const 0
  local.set $1
  loop $for-loop|0
   local.get $1
   i32.const 32
   i32.lt_s
   if
    local.get $0
    local.get $3
    local.get $1
    call $~lib/typedarray/Uint8Array#__get
    call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeU8
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|0
   end
  end
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/math/abi/encodePointerUnknownLength (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  local.get $1
  call $~lib/@btc-vision/btc-runtime/runtime/env/global/sha256
  i32.const 0
  i32.const 2032
  call $~lib/@btc-vision/btc-runtime/runtime/math/abi/encodePointer
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/storage/maps/StoredMapU256/StoredMapU256#getKeyPointer (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  i32.const 64
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#constructor
  local.tee $2
  local.get $0
  i32.load offset=4
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeBytes
  local.get $2
  local.get $1
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeU256
  local.get $0
  i32.load16_u
  local.get $2
  i32.load offset=8
  call $~lib/@btc-vision/btc-runtime/runtime/math/abi/encodePointerUnknownLength
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/storage/maps/StoredMapU256/StoredMapU256#get (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  local.get $1
  call $~lib/@btc-vision/btc-runtime/runtime/storage/maps/StoredMapU256/StoredMapU256#getKeyPointer
  local.set $0
  global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
  local.get $0
  call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#getStorageAt
  local.tee $0
  i32.load offset=8
  i32.const 32
  i32.ne
  if
   i32.const 2304
   i32.const 5664
   i32.const 220
   i32.const 30
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $0
  i32.load offset=4
  local.tee $0
  i64.load offset=24
  call $~lib/polyfills/bswap<u64>
  local.get $0
  i64.load offset=16
  call $~lib/polyfills/bswap<u64>
  local.get $0
  i64.load offset=8
  call $~lib/polyfills/bswap<u64>
  local.get $0
  i64.load
  call $~lib/polyfills/bswap<u64>
  call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#constructor
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#_exists (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  i32.load offset=64
  local.get $1
  call $~lib/@btc-vision/btc-runtime/runtime/storage/maps/StoredMapU256/StoredMapU256#get
  local.tee $0
  i64.load offset=24
  local.get $0
  i64.load offset=16
  local.get $0
  i64.load
  local.get $0
  i64.load offset=8
  i64.or
  i64.or
  i64.or
  i64.eqz
  i32.eqz
 )
 (func $~lib/string/String.__not (param $0 i32) (result i32)
  local.get $0
  if (result i32)
   local.get $0
   call $~lib/string/String#get:length
  else
   i32.const 0
  end
  i32.eqz
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/storage/BaseStoredString/BaseStoredString#getPointer (param $0 i32) (param $1 i64) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  local.get $0
  call $~lib/@btc-vision/btc-runtime/runtime/storage/BaseStoredString/BaseStoredString#getClassName@override
  local.get $0
  i32.load16_u offset=8
  local.get $0
  i32.load offset=4
  i32.const 1
  i32.const 21408
  call $~lib/@btc-vision/btc-runtime/runtime/math/abi/encodePointer
  local.tee $4
  i32.load offset=8
  i32.const 32
  i32.ne
  if
   i32.const 12144
   i32.const 10128
   i32.const 163
   i32.const 9
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  i32.const 0
  i32.const 32
  call $~lib/typedarray/Uint8Array#constructor
  local.set $5
  loop $for-loop|0
   local.get $2
   i32.const 8
   i32.lt_s
   if
    local.get $5
    i32.const 31
    local.get $2
    i32.sub
    local.get $1
    i64.const 255
    i64.and
    i32.wrap_i64
    call $~lib/typedarray/Uint8Array#__set
    local.get $1
    i64.const 8
    i64.shr_u
    local.set $1
    local.get $2
    i32.const 1
    i32.add
    local.set $2
    br $for-loop|0
   end
  end
  local.get $4
  i32.load offset=8
  i32.const 32
  i32.ne
  if (result i32)
   i32.const 1
  else
   local.get $5
   i32.load offset=8
   i32.const 32
   i32.ne
  end
  if
   i32.const 12240
   i32.const 10128
   i32.const 48
   i32.const 9
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  i32.const 0
  i32.const 32
  call $~lib/typedarray/Uint8Array#constructor
  local.set $0
  i32.const 31
  local.set $2
  loop $for-loop|1
   local.get $2
   i32.const 0
   i32.ge_s
   if
    local.get $0
    local.get $2
    local.get $4
    local.get $2
    call $~lib/typedarray/Uint8Array#__get
    local.get $5
    local.get $2
    call $~lib/typedarray/Uint8Array#__get
    i32.add
    local.get $3
    i32.add
    local.tee $3
    i32.const 255
    i32.and
    call $~lib/typedarray/Uint8Array#__set
    local.get $3
    i32.const 8
    i32.shr_u
    local.set $3
    local.get $2
    i32.const 1
    i32.sub
    local.set $2
    br $for-loop|1
   end
  end
  local.get $0
 )
 (func $~lib/string/String.UTF8.decodeUnsafe (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  local.get $0
  local.get $1
  i32.add
  local.tee $3
  local.get $0
  i32.lt_u
  if
   i32.const 0
   i32.const 2128
   i32.const 773
   i32.const 7
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $1
  i32.const 1
  i32.shl
  i32.const 2
  call $~lib/rt/stub/__new
  local.tee $4
  local.set $1
  loop $while-continue|0
   local.get $0
   local.get $3
   i32.lt_u
   if
    block $while-break|0
     local.get $0
     i32.load8_u
     local.set $5
     local.get $0
     i32.const 1
     i32.add
     local.set $0
     local.get $5
     i32.const 128
     i32.and
     if
      local.get $0
      local.get $3
      i32.eq
      br_if $while-break|0
      local.get $0
      i32.load8_u
      i32.const 63
      i32.and
      local.set $6
      local.get $0
      i32.const 1
      i32.add
      local.set $0
      local.get $5
      i32.const 224
      i32.and
      i32.const 192
      i32.eq
      if
       local.get $1
       local.get $5
       i32.const 31
       i32.and
       i32.const 6
       i32.shl
       local.get $6
       i32.or
       i32.store16
      else
       local.get $0
       local.get $3
       i32.eq
       br_if $while-break|0
       local.get $0
       i32.load8_u
       i32.const 63
       i32.and
       local.set $2
       local.get $0
       i32.const 1
       i32.add
       local.set $0
       local.get $5
       i32.const 240
       i32.and
       i32.const 224
       i32.eq
       if
        local.get $5
        i32.const 15
        i32.and
        i32.const 12
        i32.shl
        local.get $6
        i32.const 6
        i32.shl
        i32.or
        local.get $2
        i32.or
        local.set $2
       else
        local.get $0
        local.get $3
        i32.eq
        br_if $while-break|0
        local.get $0
        i32.load8_u
        i32.const 63
        i32.and
        local.get $5
        i32.const 7
        i32.and
        i32.const 18
        i32.shl
        local.get $6
        i32.const 12
        i32.shl
        i32.or
        local.get $2
        i32.const 6
        i32.shl
        i32.or
        i32.or
        local.set $2
        local.get $0
        i32.const 1
        i32.add
        local.set $0
       end
       local.get $2
       i32.const 65536
       i32.lt_u
       if
        local.get $1
        local.get $2
        i32.store16
       else
        local.get $1
        local.get $2
        i32.const 65536
        i32.sub
        local.tee $2
        i32.const 10
        i32.shr_u
        i32.const 55296
        i32.or
        local.get $2
        i32.const 1023
        i32.and
        i32.const 56320
        i32.or
        i32.const 16
        i32.shl
        i32.or
        i32.store
        local.get $1
        i32.const 2
        i32.add
        local.set $1
       end
      end
     else
      local.get $1
      local.get $5
      i32.store16
     end
     local.get $1
     i32.const 2
     i32.add
     local.set $1
     br $while-continue|0
    end
   end
  end
  local.get $4
  local.get $1
  local.get $4
  i32.sub
  call $~lib/rt/stub/__renew
 )
 (func $~lib/string/String.UTF8.decode (param $0 i32) (result i32)
  local.get $0
  local.get $0
  call $~lib/arraybuffer/ArrayBuffer#get:byteLength
  call $~lib/string/String.UTF8.decodeUnsafe
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/storage/BaseStoredString/BaseStoredString#load (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i64)
  (local $6 i32)
  (local $7 i32)
  global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
  local.get $0
  i64.const 0
  call $~lib/@btc-vision/btc-runtime/runtime/storage/BaseStoredString/BaseStoredString#getPointer
  call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#getStorageAt
  local.tee $1
  i32.const 0
  call $~lib/typedarray/Uint8Array#__get
  i32.const 24
  i32.shl
  local.get $1
  i32.const 1
  call $~lib/typedarray/Uint8Array#__get
  i32.const 16
  i32.shl
  i32.or
  local.get $1
  i32.const 2
  call $~lib/typedarray/Uint8Array#__get
  i32.const 8
  i32.shl
  i32.or
  local.get $1
  i32.const 3
  call $~lib/typedarray/Uint8Array#__get
  i32.or
  local.tee $6
  i32.eqz
  if
   local.get $0
   i32.const 2032
   i32.store offset=12
   return
  end
  i32.const 0
  local.get $6
  call $~lib/typedarray/Uint8Array#constructor
  local.set $4
  i32.const 28
  local.get $6
  local.get $6
  i32.const 28
  i32.ge_u
  select
  local.set $2
  loop $for-loop|0
   local.get $2
   local.get $3
   i32.gt_u
   if
    local.get $4
    local.get $3
    local.get $1
    local.get $3
    i32.const 4
    i32.add
    call $~lib/typedarray/Uint8Array#__get
    call $~lib/typedarray/Uint8Array#__set
    local.get $3
    i32.const 1
    i32.add
    local.set $3
    br $for-loop|0
   end
  end
  local.get $6
  local.get $2
  i32.sub
  local.set $3
  i64.const 1
  local.set $5
  loop $while-continue|1
   local.get $3
   if
    global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
    local.get $0
    local.get $5
    call $~lib/@btc-vision/btc-runtime/runtime/storage/BaseStoredString/BaseStoredString#getPointer
    call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#getStorageAt
    local.set $7
    i32.const 32
    local.get $3
    local.get $3
    i32.const 32
    i32.ge_u
    select
    local.set $6
    i32.const 0
    local.set $1
    loop $for-loop|2
     local.get $1
     local.get $6
     i32.lt_u
     if
      local.get $4
      local.get $1
      local.get $2
      i32.add
      local.get $7
      local.get $1
      call $~lib/typedarray/Uint8Array#__get
      call $~lib/typedarray/Uint8Array#__set
      local.get $1
      i32.const 1
      i32.add
      local.set $1
      br $for-loop|2
     end
    end
    local.get $3
    local.get $6
    i32.sub
    local.set $3
    local.get $2
    local.get $6
    i32.add
    local.set $2
    local.get $5
    i64.const 1
    i64.add
    local.set $5
    br $while-continue|1
   end
  end
  local.get $0
  local.get $4
  i32.load
  call $~lib/string/String.UTF8.decode
  i32.store offset=12
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/storage/BaseStoredString/BaseStoredString#get:value (param $0 i32) (result i32)
  local.get $0
  i32.load offset=12
  call $~lib/string/String.__not
  if
   local.get $0
   call $~lib/@btc-vision/btc-runtime/runtime/storage/BaseStoredString/BaseStoredString#load
  end
  local.get $0
  i32.load offset=12
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#get:baseURI (param $0 i32) (result i32)
  local.get $0
  i32.load offset=24
  call $~lib/@btc-vision/btc-runtime/runtime/storage/BaseStoredString/BaseStoredString#get:value
 )
 (func $~lib/typedarray/Uint8Array#__uget (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  i32.load offset=4
  local.get $1
  i32.add
  i32.load8_u
 )
 (func $~lib/typedarray/Uint8Array#__uset (param $0 i32) (param $1 i32) (param $2 i32)
  local.get $0
  i32.load offset=4
  local.get $1
  i32.add
  local.get $2
  i32.store8
 )
 (func $~lib/@btc-vision/as-bignum/assembly/utils/processU64 (param $0 i32) (param $1 i64)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  local.get $0
  i32.load offset=8
  i32.const 1
  i32.sub
  local.set $3
  i32.const 63
  local.set $4
  loop $for-loop|0
   local.get $4
   i32.const -1
   i32.ne
   if
    i32.const 0
    local.set $2
    loop $for-loop|1
     local.get $2
     local.get $3
     i32.le_s
     if
      local.get $0
      local.get $2
      local.get $0
      local.get $2
      call $~lib/typedarray/Uint8Array#__uget
      local.get $0
      local.get $2
      call $~lib/typedarray/Uint8Array#__uget
      i32.const 5
      i32.ge_u
      i32.const 3
      i32.mul
      i32.add
      call $~lib/typedarray/Uint8Array#__uset
      local.get $2
      i32.const 1
      i32.add
      local.set $2
      br $for-loop|1
     end
    end
    local.get $3
    local.set $2
    loop $for-loop|2
     local.get $2
     i32.const -1
     i32.ne
     if
      local.get $0
      local.get $2
      call $~lib/typedarray/Uint8Array#__uget
      i32.const 1
      i32.shl
      local.set $5
      local.get $2
      local.get $3
      i32.lt_s
      if
       local.get $0
       local.get $2
       i32.const 1
       i32.add
       local.tee $6
       local.get $0
       local.get $6
       call $~lib/typedarray/Uint8Array#__uget
       local.get $5
       i32.const 255
       i32.and
       i32.const 15
       i32.gt_u
       i32.or
       call $~lib/typedarray/Uint8Array#__uset
      end
      local.get $0
      local.get $2
      local.get $5
      i32.const 15
      i32.and
      call $~lib/typedarray/Uint8Array#__uset
      local.get $2
      i32.const 1
      i32.sub
      local.set $2
      br $for-loop|2
     end
    end
    local.get $0
    i32.const 0
    local.get $0
    i32.const 0
    call $~lib/typedarray/Uint8Array#__uget
    local.get $1
    i64.const 1
    local.get $4
    i64.extend_i32_s
    i64.shl
    i64.and
    i64.const 0
    i64.ne
    i32.add
    call $~lib/typedarray/Uint8Array#__uset
    local.get $4
    i32.const 1
    i32.sub
    local.set $4
    br $for-loop|0
   end
  end
 )
 (func $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#toString (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  local.get $0
  i64.load offset=24
  local.get $0
  i64.load offset=16
  local.get $0
  i64.load
  local.get $0
  i64.load offset=8
  i64.or
  i64.or
  i64.or
  i64.eqz
  if
   i32.const 1904
   return
  end
  i32.const 2032
  local.set $1
  i32.const 0
  i32.const 78
  call $~lib/typedarray/Uint8Array#constructor
  local.tee $2
  local.get $0
  i64.load offset=24
  call $~lib/@btc-vision/as-bignum/assembly/utils/processU64
  local.get $2
  local.get $0
  i64.load offset=16
  call $~lib/@btc-vision/as-bignum/assembly/utils/processU64
  local.get $2
  local.get $0
  i64.load offset=8
  call $~lib/@btc-vision/as-bignum/assembly/utils/processU64
  local.get $2
  local.get $0
  i64.load
  call $~lib/@btc-vision/as-bignum/assembly/utils/processU64
  i32.const 77
  local.set $0
  loop $for-loop|0
   local.get $0
   i32.const -1
   i32.ne
   if
    i32.const 1
    local.get $3
    local.get $3
    i32.eqz
    local.get $2
    local.get $0
    call $~lib/typedarray/Uint8Array#__uget
    local.tee $4
    i32.const 0
    i32.ne
    i32.and
    select
    local.tee $3
    if
     local.get $4
     i32.const 9
     i32.gt_u
     if
      i32.const 0
      i32.const 12560
      i32.const 144
      i32.const 7
      call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
      unreachable
     end
     i32.const 1
     global.set $~argumentsLength
     i32.const 2
     i32.const 2
     call $~lib/rt/stub/__new
     local.tee $5
     local.get $4
     i32.const 48
     i32.add
     i32.store16
     local.get $1
     local.get $5
     call $~lib/string/String#concat
     local.set $1
    end
    local.get $0
    i32.const 1
    i32.sub
    local.set $0
    br $for-loop|0
   end
  end
  local.get $1
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeU32 (param $0 i32) (param $1 i32)
  local.get $0
  i32.const 4
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#allocSafe
  local.get $0
  i32.load offset=4
  local.get $0
  i32.load
  local.get $1
  call $~lib/dataview/DataView#setUint32
  local.get $0
  local.get $0
  i32.load
  i32.const 4
  i32.add
  i32.store
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeStringWithLength (param $0 i32) (param $1 i32)
  i32.const 1
  global.set $~argumentsLength
  local.get $0
  local.get $1
  call $~lib/string/String.UTF8.encode@varargs
  local.tee $1
  call $~lib/arraybuffer/ArrayBuffer#get:byteLength
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeU32
  i32.const 1
  global.set $~argumentsLength
  local.get $0
  local.get $1
  call $~lib/typedarray/Uint8Array.wrap@varargs
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeBytes
 )
 (func $op721/DopamilioNFT/DopamilioNFT#tokenURI (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  local.get $1
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readU256
  local.tee $1
  call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#_exists
  i32.eqz
  if
   i32.const 11984
   i32.const 12080
   i32.const 188
   i32.const 37
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $0
  call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#get:baseURI
  i32.const 12352
  call $~lib/string/String#concat
  local.get $1
  call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#toString
  call $~lib/string/String#concat
  i32.const 12672
  call $~lib/string/String#concat
  local.tee $0
  call $~lib/string/String#get:length
  i32.const 4
  i32.add
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#constructor
  local.tee $1
  local.get $0
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeStringWithLength
  local.get $1
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/types/Address/Address#___get (param $0 i32) (param $1 i32) (result i32)
  local.get $1
  local.get $0
  i32.load offset=8
  i32.ge_u
  if
   i32.const 2176
   i32.const 2752
   i32.const 357
   i32.const 13
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $0
  i32.load offset=4
  local.get $1
  i32.add
  i32.load8_u
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/types/Address/Address#equals (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $1
  i32.load offset=8
  local.get $0
  i32.load offset=8
  i32.ne
  if
   i32.const 0
   return
  end
  loop $for-loop|0
   local.get $2
   local.get $0
   i32.load offset=8
   i32.lt_s
   if
    local.get $0
    local.get $2
    call $~lib/@btc-vision/btc-runtime/runtime/types/Address/Address#___get
    local.get $1
    local.get $2
    call $~lib/@btc-vision/btc-runtime/runtime/types/Address/Address#___get
    i32.ne
    if
     i32.const 0
     return
    end
    local.get $2
    i32.const 1
    i32.add
    local.set $2
    br $for-loop|0
   end
  end
  i32.const 1
 )
 (func $op721/DopamilioNFT/DopamilioNFT#get:_currentPhase (param $0 i32) (result i32)
  local.get $0
  i32.load offset=104
  i32.eqz
  if
   local.get $0
   global.get $op721/DopamilioNFT/currentPhasePointer
   global.get $~lib/@btc-vision/btc-runtime/runtime/math/bytes/EMPTY_POINTER
   call $~lib/@btc-vision/btc-runtime/runtime/storage/StoredU256/StoredU256#constructor
   i32.store offset=104
  end
  local.get $0
  i32.load offset=104
  local.tee $0
  i32.eqz
  if
   i32.const 9424
   i32.const 12080
   i32.const 128
   i32.const 16
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $0
 )
 (func $op721/DopamilioNFT/DopamilioNFT#_getPhase (param $0 i32) (result i32)
  local.get $0
  call $op721/DopamilioNFT/DopamilioNFT#get:_currentPhase
  call $~lib/@btc-vision/btc-runtime/runtime/storage/StoredU256/StoredU256#get:value
  i64.load
  i32.wrap_i64
 )
 (func $op721/DopamilioNFT/DopamilioNFT#get:_teamMintedTotal (param $0 i32) (result i32)
  local.get $0
  i32.load offset=116
  i32.eqz
  if
   local.get $0
   global.get $op721/DopamilioNFT/teamMintedTotalPointer
   global.get $~lib/@btc-vision/btc-runtime/runtime/math/bytes/EMPTY_POINTER
   call $~lib/@btc-vision/btc-runtime/runtime/storage/StoredU256/StoredU256#constructor
   i32.store offset=116
  end
  local.get $0
  i32.load offset=116
  local.tee $0
  i32.eqz
  if
   i32.const 9424
   i32.const 12080
   i32.const 146
   i32.const 16
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $0
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/types/SafeMath/SafeMath.add64 (param $0 i64) (param $1 i64) (result i64)
  local.get $0
  local.get $1
  i64.add
  local.tee $1
  local.get $0
  i64.lt_u
  if
   i32.const 11904
   i32.const 8464
   i32.const 95
   i32.const 13
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $1
 )
 (func $~lib/polyfills/bswap<u16> (param $0 i32) (result i32)
  local.get $0
  i32.const 8
  i32.shl
  local.get $0
  i32.const 65535
  i32.and
  i32.const 8
  i32.shr_u
  i32.or
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readU16 (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  local.get $0
  local.get $0
  i32.load offset=4
  i32.const 2
  i32.add
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#verifyEnd
  local.get $0
  i32.load offset=4
  local.tee $1
  i32.const 31
  i32.shr_u
  local.get $0
  i32.load
  local.tee $2
  i32.load offset=8
  local.get $1
  i32.const 2
  i32.add
  i32.lt_s
  i32.or
  if
   i32.const 2176
   i32.const 2416
   i32.const 79
   i32.const 7
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $1
  local.get $2
  i32.load offset=4
  i32.add
  i32.load16_u
  call $~lib/polyfills/bswap<u16>
  local.get $0
  local.get $0
  i32.load offset=4
  i32.const 2
  i32.add
  i32.store offset=4
 )
 (func $op721/DopamilioNFT/DopamilioNFT#get:_wlRoot (param $0 i32) (result i32)
  local.get $0
  i32.load offset=112
  i32.eqz
  if
   local.get $0
   global.get $op721/DopamilioNFT/wlMerkleRootPointer
   global.get $~lib/@btc-vision/btc-runtime/runtime/math/bytes/EMPTY_POINTER
   call $~lib/@btc-vision/btc-runtime/runtime/storage/StoredU256/StoredU256#constructor
   i32.store offset=112
  end
  local.get $0
  i32.load offset=112
  local.tee $0
  i32.eqz
  if
   i32.const 9424
   i32.const 12080
   i32.const 140
   i32.const 16
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $0
 )
 (func $~lib/array/Array<u32>#constructor (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  i32.const 16
  i32.const 34
  call $~lib/rt/stub/__new
  local.tee $1
  i32.const 0
  i32.store
  local.get $1
  i32.const 0
  i32.store offset=4
  local.get $1
  i32.const 0
  i32.store offset=8
  local.get $1
  i32.const 0
  i32.store offset=12
  local.get $0
  i32.const 268435455
  i32.gt_u
  if
   i32.const 2304
   i32.const 4192
   i32.const 72
   i32.const 60
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  i32.const 8
  local.get $0
  local.get $0
  i32.const 8
  i32.le_u
  select
  i32.const 2
  i32.shl
  local.tee $2
  i32.const 1
  call $~lib/rt/stub/__new
  local.tee $3
  i32.const 0
  local.get $2
  memory.fill
  local.get $1
  local.get $3
  i32.store
  local.get $1
  local.get $3
  i32.store offset=4
  local.get $1
  local.get $2
  i32.store offset=8
  local.get $1
  local.get $0
  i32.store offset=12
  local.get $1
 )
 (func $~lib/array/Array<u32>#__get (param $0 i32) (param $1 i32) (result i32)
  local.get $1
  local.get $0
  i32.load offset=12
  i32.ge_u
  if
   i32.const 2176
   i32.const 4192
   i32.const 116
   i32.const 42
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $0
  i32.load offset=4
  local.get $1
  i32.const 2
  i32.shl
  i32.add
  i32.load
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/hashing/keccak256/xorBlock (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  loop $for-loop|0
   local.get $4
   i32.const 17
   i32.lt_s
   if
    local.get $2
    local.get $3
    local.get $4
    i32.const 3
    i32.shl
    i32.add
    local.tee $6
    call $~lib/typedarray/Uint8Array#__get
    local.get $2
    local.get $6
    i32.const 1
    i32.add
    call $~lib/typedarray/Uint8Array#__get
    i32.const 8
    i32.shl
    i32.or
    local.get $2
    local.get $6
    i32.const 2
    i32.add
    call $~lib/typedarray/Uint8Array#__get
    i32.const 16
    i32.shl
    i32.or
    local.get $2
    local.get $6
    i32.const 3
    i32.add
    call $~lib/typedarray/Uint8Array#__get
    i32.const 24
    i32.shl
    i32.or
    local.set $5
    local.get $2
    local.get $6
    i32.const 4
    i32.add
    call $~lib/typedarray/Uint8Array#__get
    local.get $2
    local.get $6
    i32.const 5
    i32.add
    call $~lib/typedarray/Uint8Array#__get
    i32.const 8
    i32.shl
    i32.or
    local.get $2
    local.get $6
    i32.const 6
    i32.add
    call $~lib/typedarray/Uint8Array#__get
    i32.const 16
    i32.shl
    i32.or
    local.get $2
    local.get $6
    i32.const 7
    i32.add
    call $~lib/typedarray/Uint8Array#__get
    i32.const 24
    i32.shl
    i32.or
    local.set $6
    local.get $0
    local.get $4
    local.get $0
    local.get $4
    call $~lib/array/Array<u32>#__get
    local.get $5
    i32.xor
    call $~lib/array/Array<~lib/typedarray/Uint8Array>#__set
    local.get $1
    local.get $4
    local.get $1
    local.get $4
    call $~lib/array/Array<u32>#__get
    local.get $6
    i32.xor
    call $~lib/array/Array<~lib/typedarray/Uint8Array>#__set
    local.get $4
    i32.const 1
    i32.add
    local.set $4
    br $for-loop|0
   end
  end
 )
 (func $~lib/array/Array<i32>#__get (param $0 i32) (param $1 i32) (result i32)
  local.get $1
  local.get $0
  i32.load offset=12
  i32.ge_u
  if
   i32.const 2176
   i32.const 4192
   i32.const 116
   i32.const 42
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $0
  i32.load offset=4
  local.get $1
  i32.const 2
  i32.shl
  i32.add
  i32.load
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/hashing/keccak256/keccakF1600 (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  (local $14 i32)
  (local $15 i32)
  (local $16 i32)
  (local $17 i32)
  (local $18 i32)
  (local $19 i32)
  i32.const 5
  call $~lib/array/Array<u32>#constructor
  local.set $13
  i32.const 5
  call $~lib/array/Array<u32>#constructor
  local.set $12
  loop $for-loop|0
   local.get $11
   i32.const 24
   i32.lt_s
   if
    i32.const 0
    local.set $3
    loop $for-loop|1
     local.get $3
     i32.const 5
     i32.lt_s
     if
      local.get $13
      local.get $3
      local.get $0
      local.get $3
      call $~lib/array/Array<u32>#__get
      local.get $0
      local.get $3
      i32.const 5
      i32.add
      local.tee $2
      call $~lib/array/Array<u32>#__get
      i32.xor
      local.get $0
      local.get $3
      i32.const 10
      i32.add
      local.tee $4
      call $~lib/array/Array<u32>#__get
      i32.xor
      local.get $0
      local.get $3
      i32.const 15
      i32.add
      local.tee $5
      call $~lib/array/Array<u32>#__get
      i32.xor
      local.get $0
      local.get $3
      i32.const 20
      i32.add
      local.tee $6
      call $~lib/array/Array<u32>#__get
      i32.xor
      call $~lib/array/Array<~lib/typedarray/Uint8Array>#__set
      local.get $12
      local.get $3
      local.get $1
      local.get $3
      call $~lib/array/Array<u32>#__get
      local.get $1
      local.get $2
      call $~lib/array/Array<u32>#__get
      i32.xor
      local.get $1
      local.get $4
      call $~lib/array/Array<u32>#__get
      i32.xor
      local.get $1
      local.get $5
      call $~lib/array/Array<u32>#__get
      i32.xor
      local.get $1
      local.get $6
      call $~lib/array/Array<u32>#__get
      i32.xor
      call $~lib/array/Array<~lib/typedarray/Uint8Array>#__set
      local.get $3
      i32.const 1
      i32.add
      local.set $3
      br $for-loop|1
     end
    end
    i32.const 0
    local.set $3
    loop $for-loop|2
     local.get $3
     i32.const 5
     i32.lt_s
     if
      local.get $13
      local.get $3
      i32.const 1
      i32.add
      i32.const 5
      i32.rem_s
      local.tee $2
      call $~lib/array/Array<u32>#__get
      i32.const 1
      i32.shl
      local.get $12
      local.get $2
      call $~lib/array/Array<u32>#__get
      i32.const 31
      i32.shr_u
      i32.or
      local.set $4
      local.get $13
      local.get $2
      call $~lib/array/Array<u32>#__get
      local.set $5
      local.get $12
      local.get $2
      call $~lib/array/Array<u32>#__get
      i32.const 1
      i32.shl
      local.get $5
      i32.const 31
      i32.shr_u
      i32.or
      local.set $2
      local.get $13
      local.get $3
      i32.const 4
      i32.add
      i32.const 5
      i32.rem_s
      local.tee $5
      call $~lib/array/Array<u32>#__get
      local.get $4
      i32.xor
      local.set $4
      local.get $12
      local.get $5
      call $~lib/array/Array<u32>#__get
      local.get $2
      i32.xor
      local.set $5
      i32.const 0
      local.set $2
      loop $for-loop|3
       local.get $2
       i32.const 25
       i32.lt_s
       if
        local.get $0
        local.get $2
        local.get $3
        i32.add
        local.tee $6
        local.get $0
        local.get $6
        call $~lib/array/Array<u32>#__get
        local.get $4
        i32.xor
        call $~lib/array/Array<~lib/typedarray/Uint8Array>#__set
        local.get $1
        local.get $6
        local.get $1
        local.get $6
        call $~lib/array/Array<u32>#__get
        local.get $5
        i32.xor
        call $~lib/array/Array<~lib/typedarray/Uint8Array>#__set
        local.get $2
        i32.const 5
        i32.add
        local.set $2
        br $for-loop|3
       end
      end
      local.get $3
      i32.const 1
      i32.add
      local.set $3
      br $for-loop|2
     end
    end
    local.get $0
    i32.const 1
    call $~lib/array/Array<u32>#__get
    local.set $2
    local.get $1
    i32.const 1
    call $~lib/array/Array<u32>#__get
    local.set $3
    i32.const 0
    local.set $6
    loop $for-loop|4
     local.get $6
     i32.const 24
     i32.lt_s
     if
      local.get $0
      i32.const 7088
      local.get $6
      call $~lib/array/Array<i32>#__get
      local.tee $7
      call $~lib/array/Array<u32>#__get
      local.get $1
      local.get $7
      call $~lib/array/Array<u32>#__get
      local.set $5
      local.get $0
      local.get $7
      block $~lib/@btc-vision/btc-runtime/runtime/hashing/keccak256/rot64Lo|inlined.1 (result i32)
       local.get $2
       i32.const 6912
       local.get $6
       call $~lib/array/Array<i32>#__get
       local.tee $8
       i32.eqz
       br_if $~lib/@btc-vision/btc-runtime/runtime/hashing/keccak256/rot64Lo|inlined.1
       drop
       local.get $3
       local.get $8
       i32.const 32
       i32.eq
       br_if $~lib/@btc-vision/btc-runtime/runtime/hashing/keccak256/rot64Lo|inlined.1
       drop
       local.get $2
       local.get $8
       i32.shl
       local.get $3
       i32.const 32
       local.get $8
       i32.sub
       i32.shr_u
       i32.or
       local.get $8
       i32.const 32
       i32.lt_s
       br_if $~lib/@btc-vision/btc-runtime/runtime/hashing/keccak256/rot64Lo|inlined.1
       drop
       local.get $3
       local.get $8
       i32.const 32
       i32.sub
       i32.shl
       local.get $2
       i32.const 64
       local.get $8
       i32.sub
       i32.shr_u
       i32.or
      end
      call $~lib/array/Array<~lib/typedarray/Uint8Array>#__set
      local.get $1
      local.get $7
      block $~lib/@btc-vision/btc-runtime/runtime/hashing/keccak256/rot64Hi|inlined.1 (result i32)
       local.get $3
       i32.const 6912
       local.get $6
       call $~lib/array/Array<i32>#__get
       local.tee $7
       i32.eqz
       br_if $~lib/@btc-vision/btc-runtime/runtime/hashing/keccak256/rot64Hi|inlined.1
       drop
       local.get $2
       local.get $7
       i32.const 32
       i32.eq
       br_if $~lib/@btc-vision/btc-runtime/runtime/hashing/keccak256/rot64Hi|inlined.1
       drop
       local.get $3
       local.get $7
       i32.shl
       local.get $2
       i32.const 32
       local.get $7
       i32.sub
       i32.shr_u
       i32.or
       local.get $7
       i32.const 32
       i32.lt_s
       br_if $~lib/@btc-vision/btc-runtime/runtime/hashing/keccak256/rot64Hi|inlined.1
       drop
       local.get $2
       local.get $7
       i32.const 32
       i32.sub
       i32.shl
       local.get $3
       i32.const 64
       local.get $7
       i32.sub
       i32.shr_u
       i32.or
      end
      call $~lib/array/Array<~lib/typedarray/Uint8Array>#__set
      local.set $2
      local.get $5
      local.set $3
      local.get $6
      i32.const 1
      i32.add
      local.set $6
      br $for-loop|4
     end
    end
    i32.const 0
    local.set $3
    loop $for-loop|5
     local.get $3
     i32.const 25
     i32.lt_s
     if
      local.get $0
      local.get $3
      call $~lib/array/Array<u32>#__get
      local.set $2
      local.get $1
      local.get $3
      call $~lib/array/Array<u32>#__get
      local.set $14
      local.get $0
      local.get $3
      i32.const 1
      i32.add
      local.tee $15
      call $~lib/array/Array<u32>#__get
      local.set $16
      local.get $1
      local.get $15
      call $~lib/array/Array<u32>#__get
      local.set $10
      local.get $0
      local.get $3
      i32.const 2
      i32.add
      local.tee $17
      call $~lib/array/Array<u32>#__get
      local.set $9
      local.get $1
      local.get $17
      call $~lib/array/Array<u32>#__get
      local.set $8
      local.get $0
      local.get $3
      i32.const 3
      i32.add
      local.tee $18
      call $~lib/array/Array<u32>#__get
      local.set $7
      local.get $1
      local.get $18
      call $~lib/array/Array<u32>#__get
      local.set $6
      local.get $0
      local.get $3
      i32.const 4
      i32.add
      local.tee $19
      call $~lib/array/Array<u32>#__get
      local.set $5
      local.get $1
      local.get $19
      call $~lib/array/Array<u32>#__get
      local.set $4
      local.get $0
      local.get $3
      local.get $2
      local.get $16
      i32.const -1
      i32.xor
      local.get $9
      i32.and
      i32.xor
      call $~lib/array/Array<~lib/typedarray/Uint8Array>#__set
      local.get $1
      local.get $3
      local.get $14
      local.get $10
      i32.const -1
      i32.xor
      local.get $8
      i32.and
      i32.xor
      call $~lib/array/Array<~lib/typedarray/Uint8Array>#__set
      local.get $0
      local.get $15
      local.get $16
      local.get $9
      i32.const -1
      i32.xor
      local.get $7
      i32.and
      i32.xor
      call $~lib/array/Array<~lib/typedarray/Uint8Array>#__set
      local.get $1
      local.get $15
      local.get $10
      local.get $8
      i32.const -1
      i32.xor
      local.get $6
      i32.and
      i32.xor
      call $~lib/array/Array<~lib/typedarray/Uint8Array>#__set
      local.get $0
      local.get $17
      local.get $9
      local.get $7
      i32.const -1
      i32.xor
      local.get $5
      i32.and
      i32.xor
      call $~lib/array/Array<~lib/typedarray/Uint8Array>#__set
      local.get $1
      local.get $17
      local.get $8
      local.get $6
      i32.const -1
      i32.xor
      local.get $4
      i32.and
      i32.xor
      call $~lib/array/Array<~lib/typedarray/Uint8Array>#__set
      local.get $0
      local.get $18
      local.get $7
      local.get $5
      i32.const -1
      i32.xor
      local.get $2
      i32.and
      i32.xor
      call $~lib/array/Array<~lib/typedarray/Uint8Array>#__set
      local.get $1
      local.get $18
      local.get $6
      local.get $4
      i32.const -1
      i32.xor
      local.get $14
      i32.and
      i32.xor
      call $~lib/array/Array<~lib/typedarray/Uint8Array>#__set
      local.get $0
      local.get $19
      local.get $5
      local.get $2
      i32.const -1
      i32.xor
      local.get $16
      i32.and
      i32.xor
      call $~lib/array/Array<~lib/typedarray/Uint8Array>#__set
      local.get $1
      local.get $19
      local.get $4
      local.get $14
      i32.const -1
      i32.xor
      local.get $10
      i32.and
      i32.xor
      call $~lib/array/Array<~lib/typedarray/Uint8Array>#__set
      local.get $3
      i32.const 5
      i32.add
      local.set $3
      br $for-loop|5
     end
    end
    local.get $0
    i32.const 0
    local.get $0
    i32.const 0
    call $~lib/array/Array<u32>#__get
    i32.const 6736
    local.get $11
    call $~lib/array/Array<u32>#__get
    i32.xor
    call $~lib/array/Array<~lib/typedarray/Uint8Array>#__set
    local.get $1
    i32.const 0
    local.get $1
    i32.const 0
    call $~lib/array/Array<u32>#__get
    i32.const 6560
    local.get $11
    call $~lib/array/Array<u32>#__get
    i32.xor
    call $~lib/array/Array<~lib/typedarray/Uint8Array>#__set
    local.get $11
    i32.const 1
    i32.add
    local.set $11
    br $for-loop|0
   end
  end
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/hashing/keccak256/keccak256 (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  i32.const 25
  call $~lib/array/Array<u32>#constructor
  local.set $6
  i32.const 25
  call $~lib/array/Array<u32>#constructor
  local.set $5
  loop $for-loop|0
   local.get $1
   i32.const 25
   i32.lt_s
   if
    local.get $6
    local.get $1
    i32.const 0
    call $~lib/array/Array<~lib/typedarray/Uint8Array>#__set
    local.get $5
    local.get $1
    i32.const 0
    call $~lib/array/Array<~lib/typedarray/Uint8Array>#__set
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|0
   end
  end
  local.get $0
  i32.load offset=8
  local.set $3
  loop $while-continue|1
   local.get $2
   i32.const 136
   i32.add
   local.tee $1
   local.get $3
   i32.le_s
   if
    local.get $6
    local.get $5
    local.get $0
    local.get $2
    call $~lib/@btc-vision/btc-runtime/runtime/hashing/keccak256/xorBlock
    local.get $6
    local.get $5
    call $~lib/@btc-vision/btc-runtime/runtime/hashing/keccak256/keccakF1600
    local.get $1
    local.set $2
    br $while-continue|1
   end
  end
  local.get $3
  local.get $2
  i32.sub
  local.set $3
  i32.const 0
  i32.const 136
  call $~lib/typedarray/Uint8Array#constructor
  local.set $1
  loop $for-loop|2
   local.get $3
   local.get $7
   i32.gt_s
   if
    local.get $1
    local.get $7
    local.get $0
    local.get $2
    local.get $7
    i32.add
    call $~lib/typedarray/Uint8Array#__get
    call $~lib/typedarray/Uint8Array#__set
    local.get $7
    i32.const 1
    i32.add
    local.set $7
    br $for-loop|2
   end
  end
  local.get $1
  local.get $3
  i32.const 1
  call $~lib/typedarray/Uint8Array#__set
  local.get $1
  i32.const 135
  local.get $1
  i32.const 135
  call $~lib/typedarray/Uint8Array#__get
  i32.const 128
  i32.or
  call $~lib/typedarray/Uint8Array#__set
  local.get $6
  local.get $5
  local.get $1
  i32.const 0
  call $~lib/@btc-vision/btc-runtime/runtime/hashing/keccak256/xorBlock
  local.get $6
  local.get $5
  call $~lib/@btc-vision/btc-runtime/runtime/hashing/keccak256/keccakF1600
  i32.const 0
  i32.const 32
  call $~lib/typedarray/Uint8Array#constructor
  local.set $3
  loop $for-loop|3
   local.get $4
   i32.const 4
   i32.lt_s
   if
    local.get $6
    local.get $4
    call $~lib/array/Array<u32>#__get
    local.set $2
    local.get $5
    local.get $4
    call $~lib/array/Array<u32>#__get
    local.set $1
    local.get $3
    local.get $4
    i32.const 3
    i32.shl
    local.tee $0
    local.get $2
    i32.const 255
    i32.and
    call $~lib/typedarray/Uint8Array#__set
    local.get $3
    local.get $0
    i32.const 1
    i32.add
    local.get $2
    i32.const 8
    i32.shr_u
    i32.const 255
    i32.and
    call $~lib/typedarray/Uint8Array#__set
    local.get $3
    local.get $0
    i32.const 2
    i32.add
    local.get $2
    i32.const 16
    i32.shr_u
    i32.const 255
    i32.and
    call $~lib/typedarray/Uint8Array#__set
    local.get $3
    local.get $0
    i32.const 3
    i32.add
    local.get $2
    i32.const 24
    i32.shr_u
    call $~lib/typedarray/Uint8Array#__set
    local.get $3
    local.get $0
    i32.const 4
    i32.add
    local.get $1
    i32.const 255
    i32.and
    call $~lib/typedarray/Uint8Array#__set
    local.get $3
    local.get $0
    i32.const 5
    i32.add
    local.get $1
    i32.const 8
    i32.shr_u
    i32.const 255
    i32.and
    call $~lib/typedarray/Uint8Array#__set
    local.get $3
    local.get $0
    i32.const 6
    i32.add
    local.get $1
    i32.const 16
    i32.shr_u
    i32.const 255
    i32.and
    call $~lib/typedarray/Uint8Array#__set
    local.get $3
    local.get $0
    i32.const 7
    i32.add
    local.get $1
    i32.const 24
    i32.shr_u
    call $~lib/typedarray/Uint8Array#__set
    local.get $4
    i32.const 1
    i32.add
    local.set $4
    br $for-loop|3
   end
  end
  local.get $3
 )
 (func $~lib/typedarray/Uint8Array#set<~lib/typedarray/Uint8Array> (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  local.get $1
  i32.load offset=8
  local.set $3
  local.get $2
  i32.const 0
  i32.lt_s
  if (result i32)
   i32.const 1
  else
   local.get $0
   i32.load offset=8
   local.get $2
   local.get $3
   i32.add
   i32.lt_s
  end
  if
   i32.const 2176
   i32.const 2240
   i32.const 1911
   i32.const 5
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $0
  i32.load offset=4
  local.get $2
  i32.add
  local.get $1
  i32.load offset=4
  local.get $3
  memory.copy
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/hashing/keccak256/keccak256Concat (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  i32.const 0
  local.get $0
  i32.load offset=8
  local.get $1
  i32.load offset=8
  i32.add
  call $~lib/typedarray/Uint8Array#constructor
  local.tee $2
  local.get $0
  i32.const 0
  call $~lib/typedarray/Uint8Array#set<~lib/typedarray/Uint8Array>
  local.get $2
  local.get $1
  local.get $0
  i32.load offset=8
  call $~lib/typedarray/Uint8Array#set<~lib/typedarray/Uint8Array>
  local.get $2
  call $~lib/@btc-vision/btc-runtime/runtime/hashing/keccak256/keccak256
 )
 (func $op721/DopamilioNFT/DopamilioNFT#_verifyMerkleProof (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  local.get $0
  call $op721/DopamilioNFT/DopamilioNFT#get:_wlRoot
  call $~lib/@btc-vision/btc-runtime/runtime/storage/StoredU256/StoredU256#get:value
  local.tee $3
  i64.load offset=24
  local.get $3
  i64.load offset=16
  local.get $3
  i64.load
  local.get $3
  i64.load offset=8
  i64.or
  i64.or
  i64.or
  i64.eqz
  if
   i32.const 0
   return
  end
  local.get $1
  call $~lib/@btc-vision/btc-runtime/runtime/hashing/keccak256/keccak256
  call $~lib/@btc-vision/btc-runtime/runtime/hashing/keccak256/keccak256
  local.set $0
  loop $for-loop|0
   local.get $4
   local.get $2
   i32.load offset=12
   i32.lt_s
   if
    block $__inlined_func$op721/DopamilioNFT/DopamilioNFT#_cmpBytes32$650 (result i32)
     local.get $2
     local.get $4
     call $~lib/array/Array<~lib/@btc-vision/btc-runtime/runtime/plugins/Plugin/Plugin>#__get
     local.set $1
     i32.const 32
     call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#constructor
     local.tee $5
     local.get $1
     call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeU256
     local.get $5
     i32.load offset=8
     local.set $5
     i32.const 0
     local.set $1
     loop $for-loop|00
      local.get $1
      i32.const 32
      i32.lt_s
      if
       i32.const -1
       local.get $0
       local.get $1
       call $~lib/typedarray/Uint8Array#__get
       local.get $5
       local.get $1
       call $~lib/typedarray/Uint8Array#__get
       i32.lt_u
       br_if $__inlined_func$op721/DopamilioNFT/DopamilioNFT#_cmpBytes32$650
       drop
       i32.const 1
       local.get $0
       local.get $1
       call $~lib/typedarray/Uint8Array#__get
       local.get $5
       local.get $1
       call $~lib/typedarray/Uint8Array#__get
       i32.gt_u
       br_if $__inlined_func$op721/DopamilioNFT/DopamilioNFT#_cmpBytes32$650
       drop
       local.get $1
       i32.const 1
       i32.add
       local.set $1
       br $for-loop|00
      end
     end
     i32.const 0
    end
    i32.const 0
    i32.le_s
    if (result i32)
     local.get $0
     local.get $5
     call $~lib/@btc-vision/btc-runtime/runtime/hashing/keccak256/keccak256Concat
    else
     local.get $5
     local.get $0
     call $~lib/@btc-vision/btc-runtime/runtime/hashing/keccak256/keccak256Concat
    end
    local.set $0
    local.get $4
    i32.const 1
    i32.add
    local.set $4
    br $for-loop|0
   end
  end
  local.get $0
  i32.load offset=8
  i32.const 32
  i32.ne
  if
   i32.const 2304
   i32.const 5664
   i32.const 220
   i32.const 30
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $0
  i32.load offset=4
  local.tee $0
  i64.load offset=24
  call $~lib/polyfills/bswap<u64>
  local.get $0
  i64.load offset=16
  call $~lib/polyfills/bswap<u64>
  local.get $0
  i64.load offset=8
  call $~lib/polyfills/bswap<u64>
  local.get $0
  i64.load
  call $~lib/polyfills/bswap<u64>
  call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#constructor
  local.tee $0
  i64.load
  local.get $3
  i64.load
  i64.eq
  if (result i32)
   local.get $0
   i64.load offset=8
   local.get $3
   i64.load offset=8
   i64.eq
  else
   i32.const 0
  end
  if (result i32)
   local.get $0
   i64.load offset=16
   local.get $3
   i64.load offset=16
   i64.eq
  else
   i32.const 0
  end
  if (result i32)
   local.get $0
   i64.load offset=24
   local.get $3
   i64.load offset=24
   i64.eq
  else
   i32.const 0
  end
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/memory/AddressMemoryMap/AddressMemoryMap#encodePointer (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  i32.load16_u
  local.get $1
  i32.const 0
  i32.const 30
  call $~lib/typedarray/Uint8Array#slice
  i32.const 1
  i32.const 13472
  call $~lib/@btc-vision/btc-runtime/runtime/math/abi/encodePointer
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/memory/AddressMemoryMap/AddressMemoryMap#get (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  local.get $1
  call $~lib/@btc-vision/btc-runtime/runtime/memory/AddressMemoryMap/AddressMemoryMap#encodePointer
  local.set $0
  global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
  local.get $0
  call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#getStorageAt
  local.tee $0
  i32.load offset=8
  i32.const 32
  i32.ne
  if
   i32.const 2304
   i32.const 5664
   i32.const 220
   i32.const 30
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $0
  i32.load offset=4
  local.tee $0
  i64.load offset=24
  call $~lib/polyfills/bswap<u64>
  local.get $0
  i64.load offset=16
  call $~lib/polyfills/bswap<u64>
  local.get $0
  i64.load offset=8
  call $~lib/polyfills/bswap<u64>
  local.get $0
  i64.load
  call $~lib/polyfills/bswap<u64>
  call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#constructor
 )
 (func $op721/DopamilioNFT/DopamilioNFT#get:_mintPrice (param $0 i32) (result i32)
  local.get $0
  i32.load offset=100
  i32.eqz
  if
   local.get $0
   global.get $op721/DopamilioNFT/mintPricePointer
   global.get $~lib/@btc-vision/btc-runtime/runtime/math/bytes/EMPTY_POINTER
   call $~lib/@btc-vision/btc-runtime/runtime/storage/StoredU256/StoredU256#constructor
   i32.store offset=100
  end
  local.get $0
  i32.load offset=100
  local.tee $0
  i32.eqz
  if
   i32.const 9424
   i32.const 12080
   i32.const 122
   i32.const 16
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $0
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/env/decoders/TransactionDecoder/TransactionDecoder#hasFlag<i32> (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  i32.const 255
  i32.and
  local.get $1
  i32.and
  i32.const 0
  i32.ne
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readBytesWithLength (param $0 i32) (result i32)
  local.get $0
  local.get $0
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readU32
  i32.const 0
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readBytes
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readStringWithLength (param $0 i32) (result i32)
  local.get $0
  local.get $0
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readU32
  i32.const 1
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readBytes
  i32.load
  call $~lib/string/String.UTF8.decode
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/env/decoders/TransactionDecoder/TransactionDecoder#readTransactionOutputs (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i64)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  local.get $0
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readU16
  local.tee $3
  i32.const 65535
  i32.and
  local.set $5
  i32.const 16
  i32.const 32
  call $~lib/rt/stub/__new
  local.tee $1
  i32.const 0
  i32.store
  local.get $1
  i32.const 0
  i32.store offset=4
  local.get $1
  i32.const 0
  i32.store offset=8
  local.get $1
  i32.const 0
  i32.store offset=12
  local.get $5
  i32.const 268435455
  i32.gt_u
  if
   i32.const 2304
   i32.const 4192
   i32.const 72
   i32.const 60
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  i32.const 8
  local.get $5
  local.get $5
  i32.const 8
  i32.le_u
  select
  i32.const 2
  i32.shl
  local.tee $6
  i32.const 1
  call $~lib/rt/stub/__new
  local.tee $7
  i32.const 0
  local.get $6
  memory.fill
  local.get $1
  local.get $7
  i32.store
  local.get $1
  local.get $7
  i32.store offset=4
  local.get $1
  local.get $6
  i32.store offset=8
  local.get $1
  local.get $5
  i32.store offset=12
  loop $for-loop|0
   local.get $2
   local.get $3
   i32.const 65535
   i32.and
   i32.lt_u
   if
    local.get $0
    call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readU8
    local.set $5
    local.get $0
    call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readU16
    local.set $7
    local.get $5
    i32.const 2
    call $~lib/@btc-vision/btc-runtime/runtime/env/decoders/TransactionDecoder/TransactionDecoder#hasFlag<i32>
    if (result i32)
     local.get $0
     call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readBytesWithLength
    else
     i32.const 0
    end
    local.set $8
    local.get $5
    i32.const 1
    call $~lib/@btc-vision/btc-runtime/runtime/env/decoders/TransactionDecoder/TransactionDecoder#hasFlag<i32>
    if (result i32)
     local.get $0
     call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readStringWithLength
    else
     i32.const 0
    end
    local.set $9
    local.get $0
    call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readU64
    local.set $4
    i32.const 24
    i32.const 31
    call $~lib/rt/stub/__new
    local.tee $6
    local.get $7
    i32.store16
    local.get $6
    local.get $5
    i32.store8 offset=2
    local.get $6
    local.get $8
    i32.store offset=4
    local.get $6
    local.get $9
    i32.store offset=8
    local.get $6
    local.get $4
    i64.store offset=16
    local.get $1
    local.get $2
    local.get $6
    call $~lib/array/Array<~lib/typedarray/Uint8Array>#__set
    local.get $2
    i32.const 1
    i32.add
    local.set $2
    br $for-loop|0
   end
  end
  local.get $1
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/env/classes/Transaction/Transaction#get:outputs (param $0 i32) (result i32)
  (local $1 i32)
  local.get $0
  i32.load offset=28
  i32.eqz
  if
   call $~lib/@btc-vision/btc-runtime/runtime/env/global/getOutputsSize
   call $~lib/arraybuffer/ArrayBuffer#constructor
   local.tee $1
   call $~lib/@btc-vision/btc-runtime/runtime/env/global/outputs
   i32.const 1
   global.set $~argumentsLength
   local.get $1
   call $~lib/typedarray/Uint8Array.wrap@varargs
   call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#constructor
   local.set $1
   local.get $0
   i32.load offset=12
   drop
   local.get $0
   local.get $1
   call $~lib/@btc-vision/btc-runtime/runtime/env/decoders/TransactionDecoder/TransactionDecoder#readTransactionOutputs
   local.tee $0
   i32.store offset=28
   local.get $0
   return
  end
  local.get $0
  i32.load offset=28
  local.tee $0
  i32.eqz
  if
   i32.const 9424
   i32.const 13840
   i32.const 75
   i32.const 16
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $0
 )
 (func $op721/DopamilioNFT/DopamilioNFT#get:_treasury (param $0 i32) (result i32)
  local.get $0
  i32.load offset=108
  i32.eqz
  if
   local.get $0
   global.get $op721/DopamilioNFT/treasuryPointer
   i64.const 0
   call $~lib/@btc-vision/btc-runtime/runtime/storage/StoredString/StoredString#constructor
   i32.store offset=108
  end
  local.get $0
  i32.load offset=108
  local.tee $0
  i32.eqz
  if
   i32.const 9424
   i32.const 12080
   i32.const 134
   i32.const 16
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $0
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/types/Address/Address.zero (result i32)
  (local $0 i32)
  (local $1 i32)
  block $__inlined_func$~lib/@btc-vision/btc-runtime/runtime/types/Address/Address#clone@override$699
   global.get $~lib/@btc-vision/btc-runtime/runtime/types/Address/ZERO_ADDRESS
   local.tee $0
   i32.const 8
   i32.sub
   i32.load
   i32.const 15
   i32.eq
   if
    local.get $0
    call $~lib/@btc-vision/btc-runtime/runtime/types/ExtendedAddress/ExtendedAddress#clone
    local.set $1
    br $__inlined_func$~lib/@btc-vision/btc-runtime/runtime/types/Address/Address#clone@override$699
   end
   i32.const 0
   i32.const 0
   i32.const 0
   i32.const 10
   i32.const 14256
   call $~lib/rt/__newArray
   call $~lib/@btc-vision/btc-runtime/runtime/types/Address/Address#constructor
   local.tee $1
   i32.load offset=4
   local.get $0
   i32.load offset=4
   i32.const 32
   memory.copy
   local.get $1
   local.get $0
   i32.load8_u offset=12
   i32.store8 offset=12
  end
  local.get $1
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#_u256FromAddress (param $0 i32) (result i32)
  local.get $0
  i32.load offset=8
  i32.const 32
  i32.ne
  if
   i32.const 2304
   i32.const 5664
   i32.const 220
   i32.const 30
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $0
  i32.load offset=4
  local.tee $0
  i64.load offset=24
  call $~lib/polyfills/bswap<u64>
  local.get $0
  i64.load offset=16
  call $~lib/polyfills/bswap<u64>
  local.get $0
  i64.load offset=8
  call $~lib/polyfills/bswap<u64>
  local.get $0
  i64.load
  call $~lib/polyfills/bswap<u64>
  call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#constructor
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/storage/maps/StoredMapU256/StoredMapU256#set (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  local.get $0
  local.get $1
  call $~lib/@btc-vision/btc-runtime/runtime/storage/maps/StoredMapU256/StoredMapU256#getKeyPointer
  local.set $3
  global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
  i32.const 0
  i32.const 32
  call $~lib/typedarray/Uint8Array#constructor
  local.tee $0
  i32.load offset=4
  local.tee $1
  local.get $2
  i64.load offset=24
  call $~lib/polyfills/bswap<u64>
  i64.store
  local.get $1
  local.get $2
  i64.load offset=16
  call $~lib/polyfills/bswap<u64>
  i64.store offset=8
  local.get $1
  local.get $2
  i64.load offset=8
  call $~lib/polyfills/bswap<u64>
  i64.store offset=16
  local.get $1
  local.get $2
  i64.load
  call $~lib/polyfills/bswap<u64>
  i64.store offset=24
  local.get $3
  local.get $0
  call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#_internalSetStorageAt
 )
 (func $~lib/util/hash/HASH<~lib/@btc-vision/btc-runtime/runtime/types/Address/Address> (param $0 i32) (result i32)
  local.get $0
  i32.const -1028477379
  i32.mul
  i32.const 374761397
  i32.add
  i32.const 17
  i32.rotl
  i32.const 668265263
  i32.mul
  local.tee $0
  i32.const 15
  i32.shr_u
  local.get $0
  i32.xor
  i32.const -2048144777
  i32.mul
  local.tee $0
  i32.const 13
  i32.shr_u
  local.get $0
  i32.xor
  i32.const -1028477379
  i32.mul
  local.tee $0
  i32.const 16
  i32.shr_u
  local.get $0
  i32.xor
 )
 (func $"~lib/map/Map<~lib/@btc-vision/btc-runtime/runtime/types/Address/Address,~lib/@btc-vision/btc-runtime/runtime/storage/arrays/StoredU256Array/StoredU256Array>#find" (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  local.get $0
  i32.load
  local.get $2
  local.get $0
  i32.load offset=4
  i32.and
  i32.const 2
  i32.shl
  i32.add
  i32.load
  local.set $0
  loop $while-continue|0
   local.get $0
   if
    local.get $0
    i32.load offset=8
    local.tee $2
    i32.const 1
    i32.and
    if (result i32)
     i32.const 0
    else
     local.get $0
     i32.load
     local.get $1
     call $~lib/@btc-vision/btc-runtime/runtime/types/Address/Address#equals
    end
    if
     local.get $0
     return
    end
    local.get $2
    i32.const -2
    i32.and
    local.set $0
    br $while-continue|0
   end
  end
  i32.const 0
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/storage/arrays/StoredPackedArray/StoredPackedArray<~lib/@btc-vision/as-bignum/assembly/integer/u256/u256>#constructor (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (result i32)
  (local $4 i32)
  (local $5 i64)
  (local $6 i32)
  local.get $0
  i32.eqz
  if
   i32.const 56
   i32.const 53
   call $~lib/rt/stub/__new
   local.set $0
  end
  local.get $0
  local.get $1
  i32.store16 offset=40
  local.get $0
  local.get $2
  i32.store offset=44
  local.get $0
  local.get $3
  i32.store offset=48
  local.get $0
  i32.const -2
  i32.store offset=52
  local.get $0
  i32.const 0
  i32.store
  local.get $0
  i32.const 0
  i32.store offset=4
  local.get $0
  i32.const 0
  i32.store offset=8
  local.get $0
  i32.const 0
  i32.store offset=12
  local.get $0
  i32.const 0
  i32.store8 offset=16
  local.get $0
  i32.const 0
  i32.store8 offset=17
  i32.const 24
  i32.const 54
  call $~lib/rt/stub/__new
  local.tee $3
  i32.const 16
  call $~lib/arraybuffer/ArrayBuffer#constructor
  i32.store
  local.get $3
  i32.const 3
  i32.store offset=4
  local.get $3
  i32.const 48
  call $~lib/arraybuffer/ArrayBuffer#constructor
  i32.store offset=8
  local.get $3
  i32.const 4
  i32.store offset=12
  local.get $3
  i32.const 0
  i32.store offset=16
  local.get $3
  i32.const 0
  i32.store offset=20
  local.get $0
  local.get $3
  i32.store offset=20
  i32.const 24
  i32.const 55
  call $~lib/rt/stub/__new
  local.tee $3
  i32.const 16
  call $~lib/arraybuffer/ArrayBuffer#constructor
  i32.store
  local.get $3
  i32.const 3
  i32.store offset=4
  local.get $3
  i32.const 32
  call $~lib/arraybuffer/ArrayBuffer#constructor
  i32.store offset=8
  local.get $3
  i32.const 4
  i32.store offset=12
  local.get $3
  i32.const 0
  i32.store offset=16
  local.get $3
  i32.const 0
  i32.store offset=20
  local.get $0
  local.get $3
  i32.store offset=24
  local.get $0
  i32.const -1
  i32.store offset=28
  local.get $0
  i32.const 0
  i32.store offset=32
  local.get $0
  i32.const 0
  i32.store offset=36
  local.get $1
  local.get $2
  i32.const 1
  i32.const 14640
  call $~lib/@btc-vision/btc-runtime/runtime/math/abi/encodePointer
  local.tee $1
  i32.load
  local.set $2
  i32.const 1
  global.set $~argumentsLength
  local.get $0
  local.get $2
  call $~lib/typedarray/Uint8Array.wrap@varargs
  i32.store offset=4
  local.get $1
  i32.load offset=8
  i32.const 32
  i32.ne
  if
   i32.const 12144
   i32.const 10128
   i32.const 163
   i32.const 9
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  i64.const 1
  local.set $5
  i32.const 0
  i32.const 32
  call $~lib/typedarray/Uint8Array#constructor
  local.set $2
  loop $for-loop|0
   local.get $4
   i32.const 8
   i32.lt_s
   if
    local.get $2
    i32.const 31
    local.get $4
    i32.sub
    local.get $5
    i64.const 255
    i64.and
    i32.wrap_i64
    call $~lib/typedarray/Uint8Array#__set
    local.get $5
    i64.const 8
    i64.shr_u
    local.set $5
    local.get $4
    i32.const 1
    i32.add
    local.set $4
    br $for-loop|0
   end
  end
  local.get $1
  i32.load offset=8
  i32.const 32
  i32.ne
  if (result i32)
   i32.const 1
  else
   local.get $2
   i32.load offset=8
   i32.const 32
   i32.ne
  end
  if
   i32.const 12240
   i32.const 10128
   i32.const 48
   i32.const 9
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  i32.const 0
  i32.const 32
  call $~lib/typedarray/Uint8Array#constructor
  local.set $3
  i32.const 31
  local.set $4
  loop $for-loop|1
   local.get $4
   i32.const 0
   i32.ge_s
   if
    local.get $3
    local.get $4
    local.get $1
    local.get $4
    call $~lib/typedarray/Uint8Array#__get
    local.get $2
    local.get $4
    call $~lib/typedarray/Uint8Array#__get
    i32.add
    local.get $6
    i32.add
    local.tee $6
    i32.const 255
    i32.and
    call $~lib/typedarray/Uint8Array#__set
    local.get $6
    i32.const 8
    i32.shr_u
    local.set $6
    local.get $4
    i32.const 1
    i32.sub
    local.set $4
    br $for-loop|1
   end
  end
  local.get $0
  local.get $3
  i32.store
  block $~lib/@btc-vision/btc-runtime/runtime/math/bytes/readLengthAndStartIndex|inlined.0
   global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
   local.get $1
   call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#getStorageAt
   local.tee $1
   i32.load offset=8
   i32.const 16
   i32.lt_s
   if
    i32.const 2
    i32.const 2
    i32.const 34
    i32.const 14704
    call $~lib/rt/__newArray
    local.set $1
    br $~lib/@btc-vision/btc-runtime/runtime/math/bytes/readLengthAndStartIndex|inlined.0
   end
   local.get $1
   call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#constructor
   local.tee $1
   call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readU32
   local.set $2
   local.get $1
   call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readU32
   local.set $3
   i32.const 2
   i32.const 2
   i32.const 34
   i32.const 0
   call $~lib/rt/__newArray
   local.tee $1
   i32.const 0
   local.get $2
   call $~lib/array/Array<~lib/typedarray/Uint8Array>#__set
   local.get $1
   i32.const 1
   local.get $3
   call $~lib/array/Array<~lib/typedarray/Uint8Array>#__set
  end
  local.get $0
  local.get $1
  i32.const 0
  call $~lib/array/Array<u32>#__get
  i32.store offset=8
  local.get $0
  local.get $1
  i32.const 1
  call $~lib/array/Array<u32>#__get
  i32.store offset=12
  local.get $0
 )
 (func $"~lib/map/Map<~lib/@btc-vision/btc-runtime/runtime/types/Address/Address,~lib/@btc-vision/btc-runtime/runtime/storage/arrays/StoredU256Array/StoredU256Array>#rehash" (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  local.get $1
  i32.const 1
  i32.add
  local.tee $2
  i32.const 2
  i32.shl
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.set $6
  local.get $2
  i32.const 3
  i32.shl
  i32.const 3
  i32.div_s
  local.tee $5
  i32.const 12
  i32.mul
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.set $3
  local.get $0
  i32.load offset=8
  local.tee $7
  local.get $0
  i32.load offset=16
  i32.const 12
  i32.mul
  i32.add
  local.set $4
  local.get $3
  local.set $2
  loop $while-continue|0
   local.get $4
   local.get $7
   i32.ne
   if
    local.get $7
    i32.load offset=8
    i32.const 1
    i32.and
    i32.eqz
    if
     local.get $2
     local.get $7
     i32.load
     local.tee $8
     i32.store
     local.get $2
     local.get $7
     i32.load offset=4
     i32.store offset=4
     local.get $2
     local.get $6
     local.get $8
     call $~lib/util/hash/HASH<~lib/@btc-vision/btc-runtime/runtime/types/Address/Address>
     local.get $1
     i32.and
     i32.const 2
     i32.shl
     i32.add
     local.tee $8
     i32.load
     i32.store offset=8
     local.get $8
     local.get $2
     i32.store
     local.get $2
     i32.const 12
     i32.add
     local.set $2
    end
    local.get $7
    i32.const 12
    i32.add
    local.set $7
    br $while-continue|0
   end
  end
  local.get $0
  local.get $6
  i32.store
  local.get $0
  local.get $1
  i32.store offset=4
  local.get $0
  local.get $3
  i32.store offset=8
  local.get $0
  local.get $5
  i32.store offset=12
  local.get $0
  local.get $0
  i32.load offset=20
  i32.store offset=16
 )
 (func $"~lib/map/Map<~lib/@btc-vision/btc-runtime/runtime/types/Address/Address,~lib/@btc-vision/btc-runtime/runtime/storage/arrays/StoredU256Array/StoredU256Array>#set" (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  local.get $0
  local.get $1
  local.get $1
  call $~lib/util/hash/HASH<~lib/@btc-vision/btc-runtime/runtime/types/Address/Address>
  local.tee $3
  call $"~lib/map/Map<~lib/@btc-vision/btc-runtime/runtime/types/Address/Address,~lib/@btc-vision/btc-runtime/runtime/storage/arrays/StoredU256Array/StoredU256Array>#find"
  local.tee $4
  if
   local.get $4
   local.get $2
   i32.store offset=4
  else
   local.get $0
   i32.load offset=16
   local.get $0
   i32.load offset=12
   i32.eq
   if
    local.get $0
    local.get $0
    i32.load offset=20
    local.get $0
    i32.load offset=12
    i32.const 3
    i32.mul
    i32.const 4
    i32.div_s
    i32.lt_s
    if (result i32)
     local.get $0
     i32.load offset=4
    else
     local.get $0
     i32.load offset=4
     i32.const 1
     i32.shl
     i32.const 1
     i32.or
    end
    call $"~lib/map/Map<~lib/@btc-vision/btc-runtime/runtime/types/Address/Address,~lib/@btc-vision/btc-runtime/runtime/storage/arrays/StoredU256Array/StoredU256Array>#rehash"
   end
   local.get $0
   i32.load offset=8
   local.get $0
   local.get $0
   i32.load offset=16
   local.tee $5
   i32.const 1
   i32.add
   i32.store offset=16
   local.get $5
   i32.const 12
   i32.mul
   i32.add
   local.tee $4
   local.get $1
   i32.store
   local.get $4
   local.get $2
   i32.store offset=4
   local.get $0
   local.get $0
   i32.load offset=20
   i32.const 1
   i32.add
   i32.store offset=20
   local.get $4
   local.get $0
   i32.load
   local.get $3
   local.get $0
   i32.load offset=4
   i32.and
   i32.const 2
   i32.shl
   i32.add
   local.tee $0
   i32.load
   i32.store offset=8
   local.get $0
   local.get $4
   i32.store
  end
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#_getOwnerTokenArray (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  i32.const 0
  i32.const 30
  call $~lib/typedarray/Uint8Array#constructor
  local.set $3
  loop $for-loop|0
   local.get $2
   i32.const 30
   i32.lt_s
   if
    local.get $3
    local.get $2
    local.get $1
    local.get $2
    call $~lib/@btc-vision/btc-runtime/runtime/types/Address/Address#___get
    call $~lib/typedarray/Uint8Array#__set
    local.get $2
    i32.const 1
    i32.add
    local.set $2
    br $for-loop|0
   end
  end
  local.get $0
  i32.load offset=92
  local.get $1
  local.get $1
  call $~lib/util/hash/HASH<~lib/@btc-vision/btc-runtime/runtime/types/Address/Address>
  call $"~lib/map/Map<~lib/@btc-vision/btc-runtime/runtime/types/Address/Address,~lib/@btc-vision/btc-runtime/runtime/storage/arrays/StoredU256Array/StoredU256Array>#find"
  i32.eqz
  if
   i32.const 2
   global.set $~argumentsLength
   global.get $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/ownerTokensMapPointer
   local.set $2
   i32.const 56
   i32.const 52
   call $~lib/rt/stub/__new
   local.get $2
   local.get $3
   i64.const 0
   i64.const 0
   i64.const 0
   i64.const 0
   call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#constructor
   call $~lib/@btc-vision/btc-runtime/runtime/storage/arrays/StoredPackedArray/StoredPackedArray<~lib/@btc-vision/as-bignum/assembly/integer/u256/u256>#constructor
   local.set $2
   local.get $0
   i32.load offset=92
   local.get $1
   local.get $2
   call $"~lib/map/Map<~lib/@btc-vision/btc-runtime/runtime/types/Address/Address,~lib/@btc-vision/btc-runtime/runtime/storage/arrays/StoredU256Array/StoredU256Array>#set"
  end
  local.get $0
  i32.load offset=92
  local.get $1
  local.get $1
  call $~lib/util/hash/HASH<~lib/@btc-vision/btc-runtime/runtime/types/Address/Address>
  call $"~lib/map/Map<~lib/@btc-vision/btc-runtime/runtime/types/Address/Address,~lib/@btc-vision/btc-runtime/runtime/storage/arrays/StoredU256Array/StoredU256Array>#find"
  local.tee $0
  i32.eqz
  if
   i32.const 14736
   i32.const 14800
   i32.const 106
   i32.const 17
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $0
  i32.load offset=4
 )
 (func $"~lib/map/Map<u32,~lib/typedarray/Uint8Array>#find" (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  local.get $0
  i32.load
  local.get $2
  local.get $0
  i32.load offset=4
  i32.and
  i32.const 2
  i32.shl
  i32.add
  i32.load
  local.set $0
  loop $while-continue|0
   local.get $0
   if
    local.get $0
    i32.load offset=8
    local.tee $2
    i32.const 1
    i32.and
    if (result i32)
     i32.const 0
    else
     local.get $0
     i32.load
     local.get $1
     i32.eq
    end
    if
     local.get $0
     return
    end
    local.get $2
    i32.const -2
    i32.and
    local.set $0
    br $while-continue|0
   end
  end
  i32.const 0
 )
 (func $"~lib/map/Map<u32,~lib/typedarray/Uint8Array>#has" (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  local.get $1
  local.get $1
  call $~lib/util/hash/HASH<~lib/@btc-vision/btc-runtime/runtime/types/Address/Address>
  call $"~lib/map/Map<u32,~lib/typedarray/Uint8Array>#find"
  i32.const 0
  i32.ne
 )
 (func $"~lib/map/Map<u32,~lib/typedarray/Uint8Array>#get" (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  local.get $1
  local.get $1
  call $~lib/util/hash/HASH<~lib/@btc-vision/btc-runtime/runtime/types/Address/Address>
  call $"~lib/map/Map<u32,~lib/typedarray/Uint8Array>#find"
  local.tee $0
  i32.eqz
  if
   i32.const 14736
   i32.const 14800
   i32.const 106
   i32.const 17
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $0
  i32.load offset=4
 )
 (func $"~lib/map/Map<u32,~lib/typedarray/Uint8Array>#set" (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  local.get $0
  local.get $1
  local.get $1
  call $~lib/util/hash/HASH<~lib/@btc-vision/btc-runtime/runtime/types/Address/Address>
  local.tee $3
  call $"~lib/map/Map<u32,~lib/typedarray/Uint8Array>#find"
  local.tee $4
  if
   local.get $4
   local.get $2
   i32.store offset=4
  else
   local.get $0
   i32.load offset=16
   local.get $0
   i32.load offset=12
   i32.eq
   if
    local.get $0
    local.get $0
    i32.load offset=20
    local.get $0
    i32.load offset=12
    i32.const 3
    i32.mul
    i32.const 4
    i32.div_s
    i32.lt_s
    if (result i32)
     local.get $0
     i32.load offset=4
    else
     local.get $0
     i32.load offset=4
     i32.const 1
     i32.shl
     i32.const 1
     i32.or
    end
    call $"~lib/map/Map<~lib/@btc-vision/btc-runtime/runtime/types/Address/Address,~lib/@btc-vision/btc-runtime/runtime/storage/arrays/StoredU256Array/StoredU256Array>#rehash"
   end
   local.get $0
   i32.load offset=8
   local.get $0
   local.get $0
   i32.load offset=16
   local.tee $5
   i32.const 1
   i32.add
   i32.store offset=16
   local.get $5
   i32.const 12
   i32.mul
   i32.add
   local.tee $4
   local.get $1
   i32.store
   local.get $4
   local.get $2
   i32.store offset=4
   local.get $0
   local.get $0
   i32.load offset=20
   i32.const 1
   i32.add
   i32.store offset=20
   local.get $4
   local.get $0
   i32.load
   local.get $3
   local.get $0
   i32.load offset=4
   i32.and
   i32.const 2
   i32.shl
   i32.add
   local.tee $0
   i32.load
   i32.store offset=8
   local.get $0
   local.get $4
   i32.store
  end
 )
 (func $~lib/set/Set<u32>#rehash (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  local.get $1
  i32.const 1
  i32.add
  local.tee $2
  i32.const 2
  i32.shl
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.set $6
  local.get $2
  i32.const 3
  i32.shl
  i32.const 3
  i32.div_s
  local.tee $5
  i32.const 3
  i32.shl
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.set $3
  local.get $0
  i32.load offset=8
  local.tee $7
  local.get $0
  i32.load offset=16
  i32.const 3
  i32.shl
  i32.add
  local.set $4
  local.get $3
  local.set $2
  loop $while-continue|0
   local.get $4
   local.get $7
   i32.ne
   if
    local.get $7
    i32.load offset=4
    i32.const 1
    i32.and
    i32.eqz
    if
     local.get $2
     local.get $7
     i32.load
     local.tee $8
     i32.store
     local.get $2
     local.get $6
     local.get $8
     call $~lib/util/hash/HASH<~lib/@btc-vision/btc-runtime/runtime/types/Address/Address>
     local.get $1
     i32.and
     i32.const 2
     i32.shl
     i32.add
     local.tee $8
     i32.load
     i32.store offset=4
     local.get $8
     local.get $2
     i32.store
     local.get $2
     i32.const 8
     i32.add
     local.set $2
    end
    local.get $7
    i32.const 8
    i32.add
    local.set $7
    br $while-continue|0
   end
  end
  local.get $0
  local.get $6
  i32.store
  local.get $0
  local.get $1
  i32.store offset=4
  local.get $0
  local.get $3
  i32.store offset=8
  local.get $0
  local.get $5
  i32.store offset=12
  local.get $0
  local.get $0
  i32.load offset=20
  i32.store offset=16
 )
 (func $~lib/set/Set<u32>#add (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  local.get $1
  call $~lib/util/hash/HASH<~lib/@btc-vision/btc-runtime/runtime/types/Address/Address>
  local.set $3
  local.get $1
  local.set $2
  local.get $0
  i32.load
  local.get $3
  local.get $0
  i32.load offset=4
  i32.and
  i32.const 2
  i32.shl
  i32.add
  i32.load
  local.set $1
  block $__inlined_func$~lib/set/Set<u32>#find$1557
   loop $while-continue|0
    local.get $1
    if
     local.get $1
     i32.load offset=4
     local.tee $4
     i32.const 1
     i32.and
     if (result i32)
      i32.const 0
     else
      local.get $1
      i32.load
      local.get $2
      i32.eq
     end
     br_if $__inlined_func$~lib/set/Set<u32>#find$1557
     local.get $4
     i32.const -2
     i32.and
     local.set $1
     br $while-continue|0
    end
   end
   i32.const 0
   local.set $1
  end
  local.get $1
  i32.eqz
  if
   local.get $0
   i32.load offset=16
   local.get $0
   i32.load offset=12
   i32.eq
   if
    local.get $0
    local.get $0
    i32.load offset=20
    local.get $0
    i32.load offset=12
    i32.const 3
    i32.mul
    i32.const 4
    i32.div_s
    i32.lt_s
    if (result i32)
     local.get $0
     i32.load offset=4
    else
     local.get $0
     i32.load offset=4
     i32.const 1
     i32.shl
     i32.const 1
     i32.or
    end
    call $~lib/set/Set<u32>#rehash
   end
   local.get $0
   i32.load offset=8
   local.get $0
   local.get $0
   i32.load offset=16
   local.tee $4
   i32.const 1
   i32.add
   i32.store offset=16
   local.get $4
   i32.const 3
   i32.shl
   i32.add
   local.tee $1
   local.get $2
   i32.store
   local.get $0
   local.get $0
   i32.load offset=20
   i32.const 1
   i32.add
   i32.store offset=20
   local.get $1
   local.get $0
   i32.load
   local.get $3
   local.get $0
   i32.load offset=4
   i32.and
   i32.const 2
   i32.shl
   i32.add
   local.tee $0
   i32.load
   i32.store offset=4
   local.get $0
   local.get $1
   i32.store
  end
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/storage/arrays/StoredPackedArray/StoredPackedArray<~lib/@btc-vision/as-bignum/assembly/integer/u256/u256>#save (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  local.get $0
  i32.load offset=24
  local.tee $4
  i32.load offset=8
  local.set $6
  local.get $4
  i32.load offset=16
  local.tee $5
  call $~lib/array/Array<u32>#constructor
  local.set $7
  loop $for-loop|0
   local.get $2
   local.get $5
   i32.lt_s
   if
    local.get $6
    local.get $2
    i32.const 3
    i32.shl
    i32.add
    local.tee $4
    i32.load offset=4
    i32.const 1
    i32.and
    i32.eqz
    if
     local.get $7
     local.get $1
     local.get $4
     i32.load
     call $~lib/array/Array<~lib/typedarray/Uint8Array>#__set
     local.get $1
     i32.const 1
     i32.add
     local.set $1
    end
    local.get $2
    i32.const 1
    i32.add
    local.set $2
    br $for-loop|0
   end
  end
  local.get $7
  local.get $1
  i32.const 2
  i32.const 0
  call $~lib/array/ensureCapacity
  local.get $7
  local.get $1
  i32.store offset=12
  local.get $7
  i32.load offset=12
  local.set $1
  loop $for-loop|00
   local.get $1
   local.get $3
   i32.gt_s
   if
    local.get $7
    local.get $3
    call $~lib/array/Array<~lib/typedarray/Uint8Array>#__uget
    local.set $2
    local.get $0
    i32.load offset=20
    local.get $2
    call $"~lib/map/Map<u32,~lib/typedarray/Uint8Array>#get"
    local.tee $4
    if
     local.get $0
     local.get $2
     i64.extend_i32_u
     call $~lib/@btc-vision/btc-runtime/runtime/storage/arrays/StoredPackedArray/StoredPackedArray<~lib/@btc-vision/as-bignum/assembly/integer/u256/u256>#calculateStoragePointer@override
     local.set $2
     global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
     local.get $2
     local.get $4
     call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#_internalSetStorageAt
    end
    local.get $3
    i32.const 1
    i32.add
    local.set $3
    br $for-loop|00
   end
  end
  local.get $0
  i32.load offset=24
  local.tee $1
  i32.const 16
  call $~lib/arraybuffer/ArrayBuffer#constructor
  i32.store
  local.get $1
  i32.const 3
  i32.store offset=4
  local.get $1
  i32.const 32
  call $~lib/arraybuffer/ArrayBuffer#constructor
  i32.store offset=8
  local.get $1
  i32.const 4
  i32.store offset=12
  local.get $1
  i32.const 0
  i32.store offset=16
  local.get $1
  i32.const 0
  i32.store offset=20
  local.get $0
  i32.load8_u offset=16
  if (result i32)
   i32.const 1
  else
   local.get $0
   i32.load8_u offset=17
  end
  if
   local.get $0
   i32.load offset=8
   local.set $1
   local.get $0
   i32.load offset=12
   local.set $2
   i32.const 32
   call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#constructor
   local.tee $3
   local.get $1
   call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeU32
   local.get $3
   local.get $2
   call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeU32
   global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
   local.get $0
   i32.load offset=4
   local.get $3
   i32.load offset=8
   call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#_internalSetStorageAt
   local.get $0
   i32.const 0
   i32.store8 offset=16
   local.get $0
   i32.const 0
   i32.store8 offset=17
  end
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#_addTokenToOwnerEnumeration (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  local.get $0
  local.get $1
  call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#_getOwnerTokenArray
  local.tee $4
  i32.load offset=8
  local.set $6
  local.get $4
  local.tee $1
  i32.load offset=8
  local.get $1
  i32.load offset=52
  i32.ge_u
  if
   i32.const 14848
   i32.const 14944
   i32.const 225
   i32.const 13
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $1
  i32.load offset=12
  local.get $1
  i32.load offset=8
  i32.add
  local.get $1
  i32.load offset=52
  i32.rem_u
  local.set $5
  local.get $1
  call $~lib/@btc-vision/btc-runtime/runtime/storage/arrays/StoredPackedArray/StoredPackedArray<~lib/@btc-vision/as-bignum/assembly/integer/u256/u256>#getSlotCapacity@override
  block $~lib/@btc-vision/btc-runtime/runtime/storage/arrays/StoredPackedArray/StoredPackedArray<~lib/@btc-vision/as-bignum/assembly/integer/u256/u256>#ensureSlot|inlined.0
   local.get $5
   local.get $1
   local.tee $3
   i32.load offset=28
   i32.eq
   if
    local.get $3
    i32.load offset=32
    local.tee $1
    i32.eqz
    if
     i32.const 9424
     i32.const 14944
     i32.const 527
     i32.const 32
     call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
     unreachable
    end
    br $~lib/@btc-vision/btc-runtime/runtime/storage/arrays/StoredPackedArray/StoredPackedArray<~lib/@btc-vision/as-bignum/assembly/integer/u256/u256>#ensureSlot|inlined.0
   end
   local.get $3
   i32.load offset=20
   local.get $5
   call $"~lib/map/Map<u32,~lib/typedarray/Uint8Array>#has"
   if
    local.get $3
    i32.load offset=20
    local.get $5
    call $"~lib/map/Map<u32,~lib/typedarray/Uint8Array>#get"
    local.set $1
   else
    local.get $3
    local.get $5
    i64.extend_i32_u
    call $~lib/@btc-vision/btc-runtime/runtime/storage/arrays/StoredPackedArray/StoredPackedArray<~lib/@btc-vision/as-bignum/assembly/integer/u256/u256>#calculateStoragePointer@override
    local.set $1
    global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
    local.get $1
    call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#getStorageAt
    local.set $1
    local.get $3
    i32.load offset=20
    local.get $5
    local.get $1
    call $"~lib/map/Map<u32,~lib/typedarray/Uint8Array>#set"
   end
   local.get $3
   local.get $5
   i32.store offset=28
   local.get $3
   local.get $1
   i32.store offset=32
  end
  local.get $3
  local.get $3
  local.get $1
  call $~lib/@btc-vision/btc-runtime/runtime/storage/arrays/StoredPackedArray/StoredPackedArray<~lib/@btc-vision/as-bignum/assembly/integer/u256/u256>#unpackSlot@override
  local.tee $1
  i32.const 0
  call $~lib/array/Array<~lib/typedarray/Uint8Array>#__uget
  local.get $2
  call $~lib/@btc-vision/btc-runtime/runtime/storage/arrays/StoredPackedArray/StoredPackedArray<~lib/@btc-vision/as-bignum/assembly/integer/u256/u256>#eq@override
  i32.eqz
  if
   local.get $1
   i32.const 0
   local.get $2
   call $~lib/array/Array<~lib/typedarray/Uint8Array>#__set
   local.get $3
   local.get $1
   call $~lib/@btc-vision/btc-runtime/runtime/storage/arrays/StoredPackedArray/StoredPackedArray<~lib/@btc-vision/as-bignum/assembly/integer/u256/u256>#packSlot@override
   local.set $1
   local.get $3
   i32.load offset=20
   local.get $5
   local.get $1
   call $"~lib/map/Map<u32,~lib/typedarray/Uint8Array>#set"
   local.get $3
   i32.load offset=24
   local.get $5
   call $~lib/set/Set<u32>#add
   local.get $3
   local.get $5
   i32.store offset=28
   local.get $3
   local.get $1
   i32.store offset=32
  end
  local.get $3
  local.get $3
  i32.load offset=8
  i32.const 1
  i32.add
  i32.store offset=8
  local.get $3
  i32.const 1
  i32.store8 offset=16
  local.get $0
  i32.load offset=96
  local.get $2
  block $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256.fromU32|inlined.4 (result i32)
   local.get $6
   i32.eqz
   if
    i64.const 0
    i64.const 0
    i64.const 0
    i64.const 0
    call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#constructor
    br $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256.fromU32|inlined.4
   end
   local.get $6
   i32.const 1
   i32.eq
   if
    i64.const 1
    i64.const 0
    i64.const 0
    i64.const 0
    call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#constructor
    br $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256.fromU32|inlined.4
   end
   local.get $6
   i64.extend_i32_u
   i64.const 0
   i64.const 0
   i64.const 0
   call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#constructor
  end
  call $~lib/@btc-vision/btc-runtime/runtime/storage/maps/StoredMapU256/StoredMapU256#set
  local.get $4
  call $~lib/@btc-vision/btc-runtime/runtime/storage/arrays/StoredPackedArray/StoredPackedArray<~lib/@btc-vision/as-bignum/assembly/integer/u256/u256>#save
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/memory/AddressMemoryMap/AddressMemoryMap#set (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  i32.const 0
  i32.const 32
  call $~lib/typedarray/Uint8Array#constructor
  local.tee $3
  i32.load offset=4
  local.tee $4
  local.get $2
  i64.load offset=24
  call $~lib/polyfills/bswap<u64>
  i64.store
  local.get $4
  local.get $2
  i64.load offset=16
  call $~lib/polyfills/bswap<u64>
  i64.store offset=8
  local.get $4
  local.get $2
  i64.load offset=8
  call $~lib/polyfills/bswap<u64>
  i64.store offset=16
  local.get $4
  local.get $2
  i64.load
  call $~lib/polyfills/bswap<u64>
  i64.store offset=24
  local.get $0
  local.get $1
  call $~lib/@btc-vision/btc-runtime/runtime/memory/AddressMemoryMap/AddressMemoryMap#encodePointer
  local.set $0
  global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
  local.get $0
  local.get $3
  call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#_internalSetStorageAt
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#bufferLength (param $0 i32) (result i32)
  local.get $0
  i32.load offset=4
  i32.load offset=8
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/events/NetEvent/NetEvent#constructor (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  local.get $0
  i32.eqz
  if
   i32.const 12
   i32.const 62
   call $~lib/rt/stub/__new
   local.set $0
  end
  local.get $0
  local.get $1
  i32.store offset=4
  local.get $0
  local.get $2
  i32.store offset=8
  local.get $0
  i32.const 0
  i32.store
  local.get $2
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#bufferLength
  i32.const 352
  i32.gt_u
  if
   i32.const 15120
   i32.const 15232
   i32.const 14
   i32.const 13
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $0
  local.get $2
  i32.load offset=8
  i32.store
  local.get $0
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#emit (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  local.get $0
  i32.load
  i32.eqz
  if
   i32.const 15408
   i32.const 15232
   i32.const 30
   i32.const 13
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $0
  i32.load
  local.set $1
  local.get $0
  i32.load offset=4
  local.tee $6
  call $~lib/string/String.UTF8.byteLength
  local.set $5
  i32.const 0
  local.get $1
  i32.load offset=8
  local.get $5
  i32.const 8
  i32.add
  i32.add
  local.tee $2
  call $~lib/typedarray/Uint8Array#constructor
  local.tee $3
  i32.load offset=4
  local.tee $0
  local.get $5
  call $~lib/polyfills/bswap<u32>
  i32.store
  local.get $6
  call $~lib/string/String#get:length
  local.set $4
  i32.const 3
  global.set $~argumentsLength
  local.get $6
  local.get $4
  local.get $0
  i32.const 4
  i32.add
  call $~lib/string/String.UTF8.encodeUnsafe
  local.get $5
  i32.const 4
  i32.add
  local.get $0
  i32.add
  local.tee $0
  local.get $1
  i32.load offset=8
  call $~lib/polyfills/bswap<u32>
  i32.store
  local.get $0
  i32.const 4
  i32.add
  local.get $1
  i32.load offset=4
  local.get $1
  i32.load offset=8
  memory.copy
  local.get $3
  i32.load
  local.get $2
  call $~lib/@btc-vision/btc-runtime/runtime/env/global/emit
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/contracts/OP_NET/OP_NET#emitEvent (param $0 i32)
  local.get $0
  i32.load
  i32.eqz
  if
   i32.const 15408
   i32.const 15232
   i32.const 22
   i32.const 13
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $0
  i32.load
  i32.load offset=8
  i32.const 352
  i32.gt_u
  if
   i32.const 15120
   i32.const 11104
   i32.const 115
   i32.const 13
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $0
  call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#emit
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#_mint (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  local.get $1
  call $~lib/@btc-vision/btc-runtime/runtime/types/Address/Address.zero
  call $~lib/@btc-vision/btc-runtime/runtime/types/Address/Address#equals
  if
   i32.const 14288
   i32.const 14368
   i32.const 585
   i32.const 13
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $0
  local.get $2
  call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#_exists
  if
   i32.const 14512
   i32.const 14368
   i32.const 588
   i32.const 13
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $0
  i32.load offset=48
  call $~lib/@btc-vision/btc-runtime/runtime/storage/StoredU256/StoredU256#get:value
  local.tee $3
  i64.load offset=24
  local.get $3
  i64.load offset=16
  local.get $3
  i64.load
  local.get $3
  i64.load offset=8
  i64.or
  i64.or
  i64.or
  i64.eqz
  if (result i32)
   i32.const 1
  else
   local.get $0
   i32.load offset=44
   call $~lib/@btc-vision/btc-runtime/runtime/storage/StoredU256/StoredU256#get:value
   local.get $0
   i32.load offset=48
   call $~lib/@btc-vision/btc-runtime/runtime/storage/StoredU256/StoredU256#get:value
   call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256.lt
  end
  i32.eqz
  if
   i32.const 14576
   i32.const 14368
   i32.const 591
   i32.const 13
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $0
  i32.load offset=64
  local.get $2
  local.get $1
  call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#_u256FromAddress
  call $~lib/@btc-vision/btc-runtime/runtime/storage/maps/StoredMapU256/StoredMapU256#set
  local.get $0
  local.get $1
  local.get $2
  call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#_addTokenToOwnerEnumeration
  local.get $0
  i32.load offset=72
  local.get $1
  call $~lib/@btc-vision/btc-runtime/runtime/memory/AddressMemoryMap/AddressMemoryMap#get
  local.set $3
  local.get $0
  i32.load offset=72
  local.get $1
  local.get $3
  i64.const 1
  i64.const 0
  i64.const 0
  i64.const 0
  call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#constructor
  call $~lib/@btc-vision/btc-runtime/runtime/types/SafeMath/SafeMath.add
  call $~lib/@btc-vision/btc-runtime/runtime/memory/AddressMemoryMap/AddressMemoryMap#set
  local.get $0
  i32.load offset=44
  local.get $0
  i32.load offset=44
  call $~lib/@btc-vision/btc-runtime/runtime/storage/StoredU256/StoredU256#get:value
  i64.const 1
  i64.const 0
  i64.const 0
  i64.const 0
  call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#constructor
  call $~lib/@btc-vision/btc-runtime/runtime/types/SafeMath/SafeMath.add
  call $~lib/@btc-vision/btc-runtime/runtime/storage/StoredU256/StoredU256#set:value
  i32.const 12
  i32.const 63
  call $~lib/rt/stub/__new
  i32.const 64
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#constructor
  local.tee $3
  local.get $1
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeAddress
  local.get $3
  local.get $2
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeU256
  i32.const 15376
  local.get $3
  call $~lib/@btc-vision/btc-runtime/runtime/events/NetEvent/NetEvent#constructor
  call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP_NET/OP_NET#emitEvent
 )
 (func $op721/DopamilioNFT/DopamilioNFT#mint (param $0 i32) (param $1 i32) (result i32)
  (local $2 i64)
  (local $3 i64)
  (local $4 i64)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i64)
  (local $13 i32)
  (local $14 i32)
  block $folding-inner3
   block $folding-inner2
    global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
    local.tee $6
    i32.load offset=24
    i32.eqz
    br_if $folding-inner2
    local.get $6
    i32.load offset=24
    local.tee $6
    i32.eqz
    br_if $folding-inner3
    local.get $6
    i32.load offset=4
    local.set $8
    global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
    local.tee $6
    i32.load offset=24
    i32.eqz
    br_if $folding-inner2
    local.get $6
    i32.load offset=24
    local.tee $6
    i32.eqz
    br_if $folding-inner3
    local.get $8
    local.get $6
    i32.load offset=8
    call $~lib/@btc-vision/btc-runtime/runtime/types/Address/Address#equals
    i32.eqz
    if
     i32.const 12784
     i32.const 12080
     i32.const 208
     i32.const 13
     call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
     unreachable
    end
    local.get $1
    call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readU64
    local.tee $4
    i64.eqz
    if
     i32.const 12880
     i32.const 12080
     i32.const 212
     i32.const 27
     call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
     unreachable
    end
    local.get $4
    i64.const 10
    i64.gt_u
    if
     i32.const 12976
     i32.const 12080
     i32.const 213
     i32.const 27
     call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
     unreachable
    end
    local.get $0
    call $op721/DopamilioNFT/DopamilioNFT#_getPhase
    local.tee $6
    i32.const 255
    i32.and
    i32.eqz
    if
     i32.const 13056
     i32.const 12080
     i32.const 218
     i32.const 42
     call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
     unreachable
    end
    local.get $6
    i32.const 255
    i32.and
    i32.const 1
    i32.eq
    if
     global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
     call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#get:contractDeployer
     local.get $8
     call $~lib/@btc-vision/btc-runtime/runtime/types/Address/Address#equals
     i32.eqz
     if
      i32.const 13136
      i32.const 12080
      i32.const 222
      i32.const 17
      call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
      unreachable
     end
     local.get $0
     call $op721/DopamilioNFT/DopamilioNFT#get:_teamMintedTotal
     call $~lib/@btc-vision/btc-runtime/runtime/storage/StoredU256/StoredU256#get:value
     i64.load
     local.get $4
     call $~lib/@btc-vision/btc-runtime/runtime/types/SafeMath/SafeMath.add64
     i64.const 10
     i64.gt_u
     if
      i32.const 13248
      i32.const 12080
      i32.const 226
      i32.const 17
      call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
      unreachable
     end
    else
     local.get $6
     i32.const 255
     i32.and
     i32.const 2
     i32.eq
     if
      local.get $1
      call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readU16
      local.tee $13
      i32.const 65535
      i32.and
      local.set $9
      i32.const 16
      i32.const 61
      call $~lib/rt/stub/__new
      local.tee $14
      i32.const 0
      i32.store
      local.get $14
      i32.const 0
      i32.store offset=4
      local.get $14
      i32.const 0
      i32.store offset=8
      local.get $14
      i32.const 0
      i32.store offset=12
      local.get $9
      i32.const 268435455
      i32.gt_u
      if
       i32.const 2304
       i32.const 4192
       i32.const 72
       i32.const 60
       call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
       unreachable
      end
      i32.const 8
      local.get $9
      local.get $9
      i32.const 8
      i32.le_u
      select
      i32.const 2
      i32.shl
      local.tee $10
      i32.const 1
      call $~lib/rt/stub/__new
      local.tee $11
      i32.const 0
      local.get $10
      memory.fill
      local.get $14
      local.get $11
      i32.store
      local.get $14
      local.get $11
      i32.store offset=4
      local.get $14
      local.get $10
      i32.store offset=8
      local.get $14
      local.get $9
      i32.store offset=12
      loop $for-loop|0
       local.get $7
       local.get $13
       i32.const 65535
       i32.and
       i32.lt_u
       if
        local.get $14
        local.get $7
        local.get $1
        call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readU256
        call $~lib/array/Array<~lib/typedarray/Uint8Array>#__set
        local.get $7
        i32.const 1
        i32.add
        local.set $7
        br $for-loop|0
       end
      end
      local.get $0
      local.get $8
      local.get $14
      call $op721/DopamilioNFT/DopamilioNFT#_verifyMerkleProof
      i32.eqz
      if
       i32.const 13360
       i32.const 12080
       i32.const 233
       i32.const 17
       call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
       unreachable
      end
      local.get $0
      i32.load offset=120
      local.get $8
      call $~lib/@btc-vision/btc-runtime/runtime/memory/AddressMemoryMap/AddressMemoryMap#get
      i64.load
      local.get $4
      call $~lib/@btc-vision/btc-runtime/runtime/types/SafeMath/SafeMath.add64
      i64.const 3
      i64.gt_u
      if
       i32.const 13536
       i32.const 12080
       i32.const 237
       i32.const 17
       call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
       unreachable
      end
     else
      local.get $0
      i32.load offset=124
      local.get $8
      call $~lib/@btc-vision/btc-runtime/runtime/memory/AddressMemoryMap/AddressMemoryMap#get
      i64.load
      local.get $4
      call $~lib/@btc-vision/btc-runtime/runtime/types/SafeMath/SafeMath.add64
      i64.const 5
      i64.gt_u
      if
       i32.const 13664
       i32.const 12080
       i32.const 242
       i32.const 17
       call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
       unreachable
      end
     end
    end
    local.get $0
    i32.load offset=52
    call $~lib/@btc-vision/btc-runtime/runtime/storage/StoredU256/StoredU256#get:value
    local.tee $1
    block $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256.fromU64|inlined.3 (result i32)
     local.get $4
     i64.eqz
     if
      i64.const 0
      i64.const 0
      i64.const 0
      i64.const 0
      call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#constructor
      br $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256.fromU64|inlined.3
     end
     local.get $4
     i64.const 1
     i64.eq
     if
      i64.const 1
      i64.const 0
      i64.const 0
      i64.const 0
      call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#constructor
      br $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256.fromU64|inlined.3
     end
     local.get $4
     i64.const 0
     i64.const 0
     i64.const 0
     call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#constructor
    end
    call $~lib/@btc-vision/btc-runtime/runtime/types/SafeMath/SafeMath.add
    local.set $7
    global.get $op721/DopamilioNFT/MAX_SUPPLY
    i64.const 1
    i64.const 0
    i64.const 0
    i64.const 0
    call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#constructor
    call $~lib/@btc-vision/btc-runtime/runtime/types/SafeMath/SafeMath.add
    local.get $7
    call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256.lt
    if
     i32.const 13760
     i32.const 12080
     i32.const 248
     i32.const 13
     call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
     unreachable
    end
    local.get $4
    i64.eqz
    local.get $0
    call $op721/DopamilioNFT/DopamilioNFT#get:_mintPrice
    call $~lib/@btc-vision/btc-runtime/runtime/storage/StoredU256/StoredU256#get:value
    i64.load
    local.tee $12
    i64.eqz
    i32.or
    i32.eqz
    if
     local.get $4
     local.get $12
     i64.mul
     local.tee $3
     local.get $12
     i64.div_u
     local.get $4
     i64.ne
     if
      i32.const 8368
      i32.const 8464
      i32.const 230
      i32.const 13
      call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
      unreachable
     end
    end
    global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
    local.tee $7
    i32.load offset=24
    i32.eqz
    br_if $folding-inner2
    local.get $7
    i32.load offset=24
    local.tee $7
    i32.eqz
    br_if $folding-inner3
    local.get $7
    call $~lib/@btc-vision/btc-runtime/runtime/env/classes/Transaction/Transaction#get:outputs
    i32.load offset=12
    i32.eqz
    if
     i32.const 14000
     i32.const 12080
     i32.const 255
     i32.const 17
     call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
     unreachable
    end
    local.get $0
    call $op721/DopamilioNFT/DopamilioNFT#get:_treasury
    call $~lib/@btc-vision/btc-runtime/runtime/storage/BaseStoredString/BaseStoredString#get:value
    call $~lib/string/String#get:length
    i32.eqz
    if
     i32.const 14080
     i32.const 12080
     i32.const 258
     i32.const 40
     call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
     unreachable
    end
    global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
    local.tee $7
    i32.load offset=24
    i32.eqz
    br_if $folding-inner2
    local.get $7
    i32.load offset=24
    local.tee $7
    i32.eqz
    br_if $folding-inner3
    local.get $7
    call $~lib/@btc-vision/btc-runtime/runtime/env/classes/Transaction/Transaction#get:outputs
    local.set $7
    local.get $0
    call $op721/DopamilioNFT/DopamilioNFT#get:_treasury
    call $~lib/@btc-vision/btc-runtime/runtime/storage/BaseStoredString/BaseStoredString#get:value
    local.set $9
    loop $for-loop|00
     local.get $5
     local.get $7
     i32.load offset=12
     i32.lt_s
     if
      local.get $7
      local.get $5
      call $~lib/array/Array<~lib/@btc-vision/btc-runtime/runtime/plugins/Plugin/Plugin>#__get
      local.tee $10
      i32.load offset=8
      call $~lib/string/String.__not
      i32.eqz
      if
       local.get $10
       i32.load offset=8
       local.get $9
       call $~lib/string/String.__eq
       if
        local.get $2
        local.get $10
        i64.load offset=16
        call $~lib/@btc-vision/btc-runtime/runtime/types/SafeMath/SafeMath.add64
        local.set $2
       end
      end
      local.get $5
      i32.const 1
      i32.add
      local.set $5
      br $for-loop|00
     end
    end
    local.get $2
    local.get $3
    i64.lt_u
    if
     i32.const 14160
     i32.const 12080
     i32.const 260
     i32.const 17
     call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
     unreachable
    end
    i64.const 0
    local.set $3
    loop $for-loop|001
     local.get $3
     local.get $4
     i64.lt_u
     if
      local.get $0
      local.get $8
      local.get $1
      block $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256.fromU64|inlined.4 (result i32)
       local.get $3
       i64.eqz
       if
        i64.const 0
        i64.const 0
        i64.const 0
        i64.const 0
        call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#constructor
        br $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256.fromU64|inlined.4
       end
       local.get $3
       i64.const 1
       i64.eq
       if
        i64.const 1
        i64.const 0
        i64.const 0
        i64.const 0
        call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#constructor
        br $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256.fromU64|inlined.4
       end
       local.get $3
       i64.const 0
       i64.const 0
       i64.const 0
       call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#constructor
      end
      call $~lib/@btc-vision/btc-runtime/runtime/types/SafeMath/SafeMath.add
      call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#_mint
      local.get $3
      i64.const 1
      i64.add
      local.set $3
      br $for-loop|001
     end
    end
    local.get $0
    i32.load offset=52
    local.get $1
    block $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256.fromU64|inlined.5 (result i32)
     local.get $4
     i64.eqz
     if
      i64.const 0
      i64.const 0
      i64.const 0
      i64.const 0
      call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#constructor
      br $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256.fromU64|inlined.5
     end
     local.get $4
     i64.const 1
     i64.eq
     if
      i64.const 1
      i64.const 0
      i64.const 0
      i64.const 0
      call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#constructor
      br $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256.fromU64|inlined.5
     end
     local.get $4
     i64.const 0
     i64.const 0
     i64.const 0
     call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#constructor
    end
    call $~lib/@btc-vision/btc-runtime/runtime/types/SafeMath/SafeMath.add
    call $~lib/@btc-vision/btc-runtime/runtime/storage/StoredU256/StoredU256#set:value
    local.get $6
    i32.const 255
    i32.and
    i32.const 1
    i32.eq
    if
     local.get $0
     call $op721/DopamilioNFT/DopamilioNFT#get:_teamMintedTotal
     call $~lib/@btc-vision/btc-runtime/runtime/storage/StoredU256/StoredU256#get:value
     i64.load
     local.set $2
     local.get $0
     call $op721/DopamilioNFT/DopamilioNFT#get:_teamMintedTotal
     block $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256.fromU64|inlined.6 (result i32)
      local.get $2
      local.get $4
      call $~lib/@btc-vision/btc-runtime/runtime/types/SafeMath/SafeMath.add64
      local.tee $2
      i64.eqz
      if
       i64.const 0
       i64.const 0
       i64.const 0
       i64.const 0
       call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#constructor
       br $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256.fromU64|inlined.6
      end
      local.get $2
      i64.const 1
      i64.eq
      if
       i64.const 1
       i64.const 0
       i64.const 0
       i64.const 0
       call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#constructor
       br $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256.fromU64|inlined.6
      end
      local.get $2
      i64.const 0
      i64.const 0
      i64.const 0
      call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#constructor
     end
     call $~lib/@btc-vision/btc-runtime/runtime/storage/StoredU256/StoredU256#set:value
    else
     local.get $6
     i32.const 255
     i32.and
     i32.const 2
     i32.eq
     if
      local.get $0
      i32.load offset=120
      local.get $8
      call $~lib/@btc-vision/btc-runtime/runtime/memory/AddressMemoryMap/AddressMemoryMap#get
      i64.load
      local.set $2
      local.get $0
      i32.load offset=120
      local.get $8
      block $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256.fromU64|inlined.7 (result i32)
       local.get $2
       local.get $4
       call $~lib/@btc-vision/btc-runtime/runtime/types/SafeMath/SafeMath.add64
       local.tee $2
       i64.eqz
       if
        i64.const 0
        i64.const 0
        i64.const 0
        i64.const 0
        call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#constructor
        br $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256.fromU64|inlined.7
       end
       local.get $2
       i64.const 1
       i64.eq
       if
        i64.const 1
        i64.const 0
        i64.const 0
        i64.const 0
        call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#constructor
        br $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256.fromU64|inlined.7
       end
       local.get $2
       i64.const 0
       i64.const 0
       i64.const 0
       call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#constructor
      end
      call $~lib/@btc-vision/btc-runtime/runtime/memory/AddressMemoryMap/AddressMemoryMap#set
     else
      local.get $0
      i32.load offset=124
      local.get $8
      call $~lib/@btc-vision/btc-runtime/runtime/memory/AddressMemoryMap/AddressMemoryMap#get
      i64.load
      local.set $2
      local.get $0
      i32.load offset=124
      local.get $8
      block $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256.fromU64|inlined.8 (result i32)
       local.get $2
       local.get $4
       call $~lib/@btc-vision/btc-runtime/runtime/types/SafeMath/SafeMath.add64
       local.tee $2
       i64.eqz
       if
        i64.const 0
        i64.const 0
        i64.const 0
        i64.const 0
        call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#constructor
        br $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256.fromU64|inlined.8
       end
       local.get $2
       i64.const 1
       i64.eq
       if
        i64.const 1
        i64.const 0
        i64.const 0
        i64.const 0
        call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#constructor
        br $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256.fromU64|inlined.8
       end
       local.get $2
       i64.const 0
       i64.const 0
       i64.const 0
       call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#constructor
      end
      call $~lib/@btc-vision/btc-runtime/runtime/memory/AddressMemoryMap/AddressMemoryMap#set
     end
    end
    i32.const 32
    call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#constructor
    local.tee $0
    local.get $1
    call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeU256
    local.get $0
    return
   end
   i32.const 12704
   i32.const 5168
   i32.const 145
   i32.const 13
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  i32.const 9424
  i32.const 5168
  i32.const 147
  i32.const 16
  call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
  unreachable
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/types/Address/Address#notEquals (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  local.get $1
  call $~lib/@btc-vision/btc-runtime/runtime/types/Address/Address#equals
  i32.eqz
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/contracts/OP_NET/OP_NET#onlyDeployer (param $0 i32)
  global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
  call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#get:contractDeployer
  local.get $0
  call $~lib/@btc-vision/btc-runtime/runtime/types/Address/Address#notEquals
  if
   i32.const 15472
   i32.const 11104
   i32.const 132
   i32.const 13
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
 )
 (func $op721/DopamilioNFT/PhaseActivatedEvent#constructor (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  i32.const 12
  i32.const 64
  call $~lib/rt/stub/__new
  i32.const 1
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#constructor
  local.tee $2
  local.get $0
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeU8
  i32.const 15664
  local.get $2
  call $~lib/@btc-vision/btc-runtime/runtime/events/NetEvent/NetEvent#constructor
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeBoolean (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.eqz
  i32.eqz
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeU8
 )
 (func $op721/DopamilioNFT/DopamilioNFT#activateWL (param $0 i32) (result i32)
  (local $1 i32)
  global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
  local.tee $1
  i32.load offset=24
  i32.eqz
  if
   i32.const 12704
   i32.const 5168
   i32.const 145
   i32.const 13
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $1
  i32.load offset=24
  local.tee $1
  i32.eqz
  if
   i32.const 9424
   i32.const 5168
   i32.const 147
   i32.const 16
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $1
  i32.load offset=4
  call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP_NET/OP_NET#onlyDeployer
  local.get $0
  call $op721/DopamilioNFT/DopamilioNFT#get:_currentPhase
  call $~lib/@btc-vision/btc-runtime/runtime/storage/StoredU256/StoredU256#get:value
  i64.load
  i64.const 1
  i64.ne
  if
   i32.const 15712
   i32.const 12080
   i32.const 309
   i32.const 53
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $0
  call $op721/DopamilioNFT/DopamilioNFT#get:_wlRoot
  call $~lib/@btc-vision/btc-runtime/runtime/storage/StoredU256/StoredU256#get:value
  local.tee $1
  i64.load offset=24
  local.get $1
  i64.load offset=16
  local.get $1
  i64.load
  local.get $1
  i64.load offset=8
  i64.or
  i64.or
  i64.or
  i64.eqz
  if
   i32.const 15808
   i32.const 12080
   i32.const 310
   i32.const 42
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $0
  call $op721/DopamilioNFT/DopamilioNFT#get:_currentPhase
  i64.const 2
  i64.const 0
  i64.const 0
  i64.const 0
  call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#constructor
  call $~lib/@btc-vision/btc-runtime/runtime/storage/StoredU256/StoredU256#set:value
  i32.const 2
  call $op721/DopamilioNFT/PhaseActivatedEvent#constructor
  call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#emit
  i32.const 1
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#constructor
  local.tee $0
  i32.const 1
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeBoolean
  local.get $0
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/storage/BaseStoredString/BaseStoredString#save (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i64)
  (local $5 i32)
  (local $6 i64)
  (local $7 i32)
  (local $8 i32)
  global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
  local.get $0
  i64.const 0
  call $~lib/@btc-vision/btc-runtime/runtime/storage/BaseStoredString/BaseStoredString#getPointer
  call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#getStorageAt
  local.tee $1
  i32.const 0
  call $~lib/typedarray/Uint8Array#__get
  i32.const 24
  i32.shl
  local.get $1
  i32.const 1
  call $~lib/typedarray/Uint8Array#__get
  i32.const 16
  i32.shl
  i32.or
  local.get $1
  i32.const 2
  call $~lib/typedarray/Uint8Array#__get
  i32.const 8
  i32.shl
  i32.or
  local.get $1
  i32.const 3
  call $~lib/typedarray/Uint8Array#__get
  i32.or
  local.tee $1
  if
   local.get $1
   i32.const 28
   i32.sub
   i64.extend_i32_u
   i64.const 0
   local.get $1
   i32.const 28
   i32.gt_u
   select
   local.tee $6
   i64.const 0
   i64.ne
   if (result i64)
    local.get $6
    i64.const 31
    i64.add
    i64.const 5
    i64.shr_u
    i64.const 1
    i64.add
   else
    i64.const 1
   end
   local.set $6
   loop $for-loop|0
    local.get $4
    local.get $6
    i64.lt_u
    if
     global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
     local.get $0
     local.get $4
     call $~lib/@btc-vision/btc-runtime/runtime/storage/BaseStoredString/BaseStoredString#getPointer
     i32.const 0
     i32.const 32
     call $~lib/typedarray/Uint8Array#constructor
     call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#_internalSetStorageAt
     local.get $4
     i64.const 1
     i64.add
     local.set $4
     br $for-loop|0
    end
   end
  end
  local.get $0
  i32.load offset=12
  i32.const 2
  global.set $~argumentsLength
  call $~lib/string/String.UTF8.encode@varargs
  local.tee $1
  call $~lib/arraybuffer/ArrayBuffer#get:byteLength
  local.tee $7
  local.get $0
  i32.load
  i32.gt_u
  if
   local.get $0
   call $~lib/@btc-vision/btc-runtime/runtime/storage/BaseStoredString/BaseStoredString#getClassName@override
   local.get $0
   i32.load
   call $~lib/number/U32#toString
   local.set $0
   i32.const 16384
   i32.const 0
   i32.const 21408
   call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
   i32.const 16384
   i32.const 2
   local.get $0
   call $~lib/staticarray/StaticArray<~lib/string/String>#__uset
   i32.const 16384
   call $~lib/staticarray/StaticArray<~lib/string/String>#join
   i32.const 16432
   i32.const 111
   i32.const 13
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $7
  i32.eqz
  if
   global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
   local.get $0
   i64.const 0
   call $~lib/@btc-vision/btc-runtime/runtime/storage/BaseStoredString/BaseStoredString#getPointer
   i32.const 0
   i32.const 32
   call $~lib/typedarray/Uint8Array#constructor
   call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#_internalSetStorageAt
   return
  end
  i32.const 0
  i32.const 32
  call $~lib/typedarray/Uint8Array#constructor
  local.tee $8
  i32.const 0
  local.get $7
  i32.const 24
  i32.shr_u
  call $~lib/typedarray/Uint8Array#__set
  local.get $8
  i32.const 1
  local.get $7
  i32.const 16
  i32.shr_u
  i32.const 255
  i32.and
  call $~lib/typedarray/Uint8Array#__set
  local.get $8
  i32.const 2
  local.get $7
  i32.const 8
  i32.shr_u
  i32.const 255
  i32.and
  call $~lib/typedarray/Uint8Array#__set
  local.get $8
  i32.const 3
  local.get $7
  i32.const 255
  i32.and
  call $~lib/typedarray/Uint8Array#__set
  i32.const 1
  global.set $~argumentsLength
  local.get $1
  call $~lib/typedarray/Uint8Array.wrap@varargs
  local.set $5
  i32.const 28
  local.get $7
  local.get $7
  i32.const 28
  i32.ge_u
  select
  local.set $2
  loop $for-loop|00
   local.get $2
   local.get $3
   i32.gt_u
   if
    local.get $8
    local.get $3
    i32.const 4
    i32.add
    local.get $5
    local.get $3
    call $~lib/typedarray/Uint8Array#__get
    call $~lib/typedarray/Uint8Array#__set
    local.get $3
    i32.const 1
    i32.add
    local.set $3
    br $for-loop|00
   end
  end
  global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
  local.get $0
  i64.const 0
  call $~lib/@btc-vision/btc-runtime/runtime/storage/BaseStoredString/BaseStoredString#getPointer
  local.get $8
  call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#_internalSetStorageAt
  local.get $7
  local.get $2
  i32.sub
  local.set $3
  i64.const 1
  local.set $4
  loop $while-continue|1
   local.get $3
   if
    i32.const 0
    i32.const 32
    call $~lib/typedarray/Uint8Array#constructor
    local.set $8
    i32.const 32
    local.get $3
    local.get $3
    i32.const 32
    i32.ge_u
    select
    local.set $7
    i32.const 0
    local.set $1
    loop $for-loop|2
     local.get $1
     local.get $7
     i32.lt_u
     if
      local.get $8
      local.get $1
      local.get $5
      local.get $1
      local.get $2
      i32.add
      call $~lib/typedarray/Uint8Array#__get
      call $~lib/typedarray/Uint8Array#__set
      local.get $1
      i32.const 1
      i32.add
      local.set $1
      br $for-loop|2
     end
    end
    global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
    local.get $0
    local.get $4
    call $~lib/@btc-vision/btc-runtime/runtime/storage/BaseStoredString/BaseStoredString#getPointer
    local.get $8
    call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#_internalSetStorageAt
    local.get $3
    local.get $7
    i32.sub
    local.set $3
    local.get $2
    local.get $7
    i32.add
    local.set $2
    local.get $4
    i64.const 1
    i64.add
    local.set $4
    br $while-continue|1
   end
  end
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/storage/BaseStoredString/BaseStoredString#set:value (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  i32.store offset=12
  local.get $0
  call $~lib/@btc-vision/btc-runtime/runtime/storage/BaseStoredString/BaseStoredString#save
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#get:name (param $0 i32) (result i32)
  local.get $0
  i32.load offset=16
  call $~lib/@btc-vision/btc-runtime/runtime/storage/BaseStoredString/BaseStoredString#get:value
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#get:symbol (param $0 i32) (result i32)
  local.get $0
  i32.load offset=20
  call $~lib/@btc-vision/btc-runtime/runtime/storage/BaseStoredString/BaseStoredString#get:value
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#get:maxSupply (param $0 i32) (result i32)
  local.get $0
  i32.load offset=48
  call $~lib/@btc-vision/btc-runtime/runtime/storage/StoredU256/StoredU256#get:value
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#changeMetadata (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
  local.tee $2
  i32.load offset=24
  i32.eqz
  if
   i32.const 12704
   i32.const 5168
   i32.const 145
   i32.const 13
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $2
  i32.load offset=24
  local.tee $2
  i32.eqz
  if
   i32.const 9424
   i32.const 5168
   i32.const 147
   i32.const 16
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $2
  i32.load offset=4
  call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP_NET/OP_NET#onlyDeployer
  local.get $1
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readStringWithLength
  local.set $3
  local.get $1
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readStringWithLength
  local.set $4
  local.get $1
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readStringWithLength
  local.set $2
  local.get $1
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readStringWithLength
  local.set $1
  local.get $3
  call $~lib/string/String#get:length
  i32.eqz
  if
   i32.const 16720
   i32.const 14368
   i32.const 246
   i32.const 31
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $4
  call $~lib/string/String#get:length
  i32.eqz
  if
   i32.const 16784
   i32.const 14368
   i32.const 247
   i32.const 33
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $2
  call $~lib/string/String#get:length
  i32.eqz
  if
   i32.const 16848
   i32.const 14368
   i32.const 248
   i32.const 38
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $1
  call $~lib/string/String#get:length
  i32.eqz
  if
   i32.const 16928
   i32.const 14368
   i32.const 249
   i32.const 34
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $0
  i32.load offset=32
  local.get $3
  call $~lib/@btc-vision/btc-runtime/runtime/storage/BaseStoredString/BaseStoredString#set:value
  local.get $0
  i32.load offset=28
  local.get $4
  call $~lib/@btc-vision/btc-runtime/runtime/storage/BaseStoredString/BaseStoredString#set:value
  local.get $0
  i32.load offset=36
  local.get $2
  call $~lib/@btc-vision/btc-runtime/runtime/storage/BaseStoredString/BaseStoredString#set:value
  local.get $0
  i32.load offset=40
  local.get $1
  call $~lib/@btc-vision/btc-runtime/runtime/storage/BaseStoredString/BaseStoredString#set:value
  i32.const 0
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#constructor
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#get:totalSupply (param $0 i32) (result i32)
  local.get $0
  i32.load offset=44
  call $~lib/@btc-vision/btc-runtime/runtime/storage/StoredU256/StoredU256#get:value
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#_balanceOf (param $0 i32) (param $1 i32) (result i32)
  local.get $1
  call $~lib/@btc-vision/btc-runtime/runtime/types/Address/Address.zero
  call $~lib/@btc-vision/btc-runtime/runtime/types/Address/Address#equals
  if
   i32.const 17008
   i32.const 14368
   i32.const 751
   i32.const 13
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $0
  i32.load offset=72
  local.get $1
  call $~lib/@btc-vision/btc-runtime/runtime/memory/AddressMemoryMap/AddressMemoryMap#get
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#_addressFromU256 (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  i32.const 0
  i32.const 32
  call $~lib/typedarray/Uint8Array#constructor
  local.tee $3
  i32.load offset=4
  local.tee $2
  local.get $0
  i64.load offset=24
  call $~lib/polyfills/bswap<u64>
  i64.store
  local.get $2
  local.get $0
  i64.load offset=16
  call $~lib/polyfills/bswap<u64>
  i64.store offset=8
  local.get $2
  local.get $0
  i64.load offset=8
  call $~lib/polyfills/bswap<u64>
  i64.store offset=16
  local.get $2
  local.get $0
  i64.load
  call $~lib/polyfills/bswap<u64>
  i64.store offset=24
  i32.const 0
  i32.const 0
  i32.const 0
  i32.const 10
  i32.const 17072
  call $~lib/rt/__newArray
  call $~lib/@btc-vision/btc-runtime/runtime/types/Address/Address#constructor
  local.set $0
  loop $for-loop|0
   local.get $1
   i32.const 32
   i32.lt_s
   if
    local.get $0
    local.get $1
    local.get $3
    local.get $1
    call $~lib/typedarray/Uint8Array#__get
    call $~lib/@btc-vision/btc-runtime/runtime/types/Address/Address#___set
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|0
   end
  end
  local.get $0
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#_ownerOf (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  i32.load offset=64
  local.get $1
  call $~lib/@btc-vision/btc-runtime/runtime/storage/maps/StoredMapU256/StoredMapU256#get
  local.tee $0
  i64.load offset=24
  local.get $0
  i64.load offset=16
  local.get $0
  i64.load
  local.get $0
  i64.load offset=8
  i64.or
  i64.or
  i64.or
  i64.eqz
  if
   i32.const 16656
   i32.const 14368
   i32.const 744
   i32.const 13
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $0
  call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#_addressFromU256
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/memory/Nested/Nested<~lib/@btc-vision/as-bignum/assembly/integer/u256/u256>#constructor (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  i32.const 6
  i32.const 46
  call $~lib/rt/stub/__new
  local.tee $2
  i32.const 0
  i32.store
  local.get $2
  i32.const 0
  i32.store16 offset=4
  local.get $2
  local.get $1
  i32.store16 offset=4
  local.get $2
  local.get $0
  i32.store
  local.get $2
 )
 (func $"~lib/@btc-vision/btc-runtime/runtime/generic/Map/Map<~lib/@btc-vision/btc-runtime/runtime/types/Address/Address,~lib/@btc-vision/btc-runtime/runtime/memory/Nested/Nested<~lib/@btc-vision/as-bignum/assembly/integer/u256/u256>>#set" (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  local.get $0
  i32.load offset=8
  i32.const -1
  i32.ne
  if
   local.get $0
   i32.load
   local.get $0
   i32.load offset=8
   call $~lib/array/Array<~lib/typedarray/Uint8Array>#__uget
   local.get $1
   call $~lib/@btc-vision/btc-runtime/runtime/types/Address/Address#equals
   if
    local.get $0
    i32.load offset=4
    local.get $0
    i32.load offset=8
    local.get $2
    call $~lib/array/Array<~lib/typedarray/Uint8Array>#__set
    local.get $0
    return
   end
  end
  local.get $0
  local.get $1
  call $"~lib/@btc-vision/btc-runtime/runtime/generic/Map/Map<~lib/@btc-vision/btc-runtime/runtime/types/Address/Address,~lib/@btc-vision/btc-runtime/runtime/memory/Nested/Nested<~lib/@btc-vision/as-bignum/assembly/integer/u256/u256>>#indexOf@override"
  local.tee $3
  i32.const -1
  i32.eq
  if
   local.get $0
   i32.load
   local.get $1
   call $~lib/array/Array<~lib/typedarray/Uint8Array>#push
   local.get $0
   i32.load offset=4
   local.get $2
   call $~lib/array/Array<~lib/typedarray/Uint8Array>#push
   local.get $0
   local.get $0
   i32.load
   i32.load offset=12
   i32.const 1
   i32.sub
   i32.store offset=8
  else
   local.get $0
   i32.load offset=4
   local.get $3
   local.get $2
   call $~lib/array/Array<~lib/typedarray/Uint8Array>#__set
   local.get $0
   local.get $3
   i32.store offset=8
  end
  local.get $0
 )
 (func $"~lib/@btc-vision/btc-runtime/runtime/generic/Map/Map<~lib/@btc-vision/btc-runtime/runtime/types/Address/Address,~lib/@btc-vision/btc-runtime/runtime/memory/Nested/Nested<~lib/@btc-vision/as-bignum/assembly/integer/u256/u256>>#get" (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  local.get $1
  call $"~lib/@btc-vision/btc-runtime/runtime/generic/Map/Map<~lib/@btc-vision/btc-runtime/runtime/types/Address/Address,~lib/@btc-vision/btc-runtime/runtime/memory/Nested/Nested<~lib/@btc-vision/as-bignum/assembly/integer/u256/u256>>#indexOf@override"
  local.tee $1
  i32.const -1
  i32.eq
  if
   i32.const 17296
   i32.const 17376
   i32.const 92
   i32.const 13
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $0
  i32.load offset=4
  local.get $1
  call $~lib/array/Array<~lib/typedarray/Uint8Array>#__uget
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/memory/Nested/Nested<~lib/@btc-vision/as-bignum/assembly/integer/u256/u256>#getKeyHash (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $1
  i32.load offset=8
  local.get $0
  i32.load
  i32.load offset=8
  i32.add
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#constructor
  local.tee $2
  local.get $0
  i32.load
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeBytes
  local.get $2
  local.get $1
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeBytes
  local.get $0
  i32.load16_u offset=4
  local.get $2
  i32.load offset=8
  call $~lib/@btc-vision/btc-runtime/runtime/math/abi/encodePointerUnknownLength
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#_isApprovedForAll (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  local.get $0
  i32.load offset=76
  local.tee $0
  local.get $1
  call $"~lib/@btc-vision/btc-runtime/runtime/generic/Map/Map<~lib/@btc-vision/btc-runtime/runtime/types/Address/Address,~lib/@btc-vision/btc-runtime/runtime/memory/Nested/Nested<~lib/@btc-vision/as-bignum/assembly/integer/u256/u256>>#indexOf@override"
  i32.const -1
  i32.eq
  if
   local.get $0
   local.get $1
   local.get $1
   local.get $0
   i32.load16_u offset=12
   call $~lib/@btc-vision/btc-runtime/runtime/memory/Nested/Nested<~lib/@btc-vision/as-bignum/assembly/integer/u256/u256>#constructor
   call $"~lib/@btc-vision/btc-runtime/runtime/generic/Map/Map<~lib/@btc-vision/btc-runtime/runtime/types/Address/Address,~lib/@btc-vision/btc-runtime/runtime/memory/Nested/Nested<~lib/@btc-vision/as-bignum/assembly/integer/u256/u256>>#set"
   drop
  end
  local.get $0
  local.get $1
  call $"~lib/@btc-vision/btc-runtime/runtime/generic/Map/Map<~lib/@btc-vision/btc-runtime/runtime/types/Address/Address,~lib/@btc-vision/btc-runtime/runtime/memory/Nested/Nested<~lib/@btc-vision/as-bignum/assembly/integer/u256/u256>>#get"
  local.get $2
  call $~lib/@btc-vision/btc-runtime/runtime/memory/Nested/Nested<~lib/@btc-vision/as-bignum/assembly/integer/u256/u256>#getKeyHash
  local.set $0
  global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
  local.get $0
  call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#getStorageAt
  local.tee $0
  i32.load offset=8
  i32.const 32
  i32.ne
  if
   i32.const 2304
   i32.const 5664
   i32.const 220
   i32.const 30
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $0
  i32.load offset=4
  local.tee $0
  i64.load offset=24
  call $~lib/polyfills/bswap<u64>
  local.get $0
  i64.load offset=16
  call $~lib/polyfills/bswap<u64>
  local.get $0
  i64.load offset=8
  call $~lib/polyfills/bswap<u64>
  local.get $0
  i64.load
  call $~lib/polyfills/bswap<u64>
  call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#constructor
  local.tee $0
  i64.load offset=24
  local.get $0
  i64.load offset=16
  local.get $0
  i64.load
  local.get $0
  i64.load offset=8
  i64.or
  i64.or
  i64.or
  i64.eqz
  i32.eqz
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/storage/maps/StoredMapU256/StoredMapU256#delete (param $0 i32) (param $1 i32)
  local.get $0
  local.get $1
  call $~lib/@btc-vision/btc-runtime/runtime/storage/maps/StoredMapU256/StoredMapU256#getKeyPointer
  local.set $0
  global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
  local.get $0
  global.get $~lib/@btc-vision/btc-runtime/runtime/math/bytes/EMPTY_BUFFER
  call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#_internalSetStorageAt
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#_removeTokenFromOwnerEnumeration (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  local.get $0
  local.get $1
  call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#_getOwnerTokenArray
  local.tee $4
  i32.load offset=8
  local.tee $1
  i32.eqz
  if
   i32.const 17584
   i32.const 14368
   i32.const 925
   i32.const 13
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  block $folding-inner0
   local.get $0
   i32.load offset=96
   local.get $2
   call $~lib/@btc-vision/btc-runtime/runtime/storage/maps/StoredMapU256/StoredMapU256#get
   i64.load
   i32.wrap_i64
   local.tee $5
   local.get $1
   i32.const 1
   i32.sub
   local.tee $1
   i32.ne
   if
    local.get $1
    local.get $4
    i32.load offset=52
    i32.ge_u
    if
     i32.const 17648
     i32.const 14944
     i32.const 110
     i32.const 13
     call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
     unreachable
    end
    local.get $4
    i32.load offset=12
    local.get $1
    i32.add
    local.get $4
    i32.load offset=52
    i32.rem_u
    local.set $3
    local.get $4
    call $~lib/@btc-vision/btc-runtime/runtime/storage/arrays/StoredPackedArray/StoredPackedArray<~lib/@btc-vision/as-bignum/assembly/integer/u256/u256>#getSlotCapacity@override
    block $~lib/@btc-vision/btc-runtime/runtime/storage/arrays/StoredPackedArray/StoredPackedArray<~lib/@btc-vision/as-bignum/assembly/integer/u256/u256>#ensureSlot|inlined.1
     local.get $3
     local.get $4
     i32.load offset=28
     i32.eq
     if
      local.get $4
      i32.load offset=32
      local.tee $1
      i32.eqz
      br_if $folding-inner0
      br $~lib/@btc-vision/btc-runtime/runtime/storage/arrays/StoredPackedArray/StoredPackedArray<~lib/@btc-vision/as-bignum/assembly/integer/u256/u256>#ensureSlot|inlined.1
     end
     local.get $4
     i32.load offset=20
     local.get $3
     call $"~lib/map/Map<u32,~lib/typedarray/Uint8Array>#has"
     if
      local.get $4
      i32.load offset=20
      local.get $3
      call $"~lib/map/Map<u32,~lib/typedarray/Uint8Array>#get"
      local.set $1
     else
      local.get $4
      local.get $3
      i64.extend_i32_u
      call $~lib/@btc-vision/btc-runtime/runtime/storage/arrays/StoredPackedArray/StoredPackedArray<~lib/@btc-vision/as-bignum/assembly/integer/u256/u256>#calculateStoragePointer@override
      local.set $1
      global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
      local.get $1
      call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#getStorageAt
      local.set $1
      local.get $4
      i32.load offset=20
      local.get $3
      local.get $1
      call $"~lib/map/Map<u32,~lib/typedarray/Uint8Array>#set"
     end
     local.get $4
     local.get $3
     i32.store offset=28
     local.get $4
     local.get $1
     i32.store offset=32
    end
    local.get $4
    local.get $1
    call $~lib/@btc-vision/btc-runtime/runtime/storage/arrays/StoredPackedArray/StoredPackedArray<~lib/@btc-vision/as-bignum/assembly/integer/u256/u256>#unpackSlot@override
    i32.const 0
    call $~lib/array/Array<~lib/typedarray/Uint8Array>#__uget
    local.set $6
    local.get $5
    local.get $4
    i32.load offset=52
    i32.ge_u
    if
     i32.const 17712
     i32.const 14944
     i32.const 146
     i32.const 13
     call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
     unreachable
    end
    local.get $4
    i32.load offset=12
    local.get $5
    i32.add
    local.get $4
    i32.load offset=52
    i32.rem_u
    local.set $3
    local.get $4
    call $~lib/@btc-vision/btc-runtime/runtime/storage/arrays/StoredPackedArray/StoredPackedArray<~lib/@btc-vision/as-bignum/assembly/integer/u256/u256>#getSlotCapacity@override
    block $~lib/@btc-vision/btc-runtime/runtime/storage/arrays/StoredPackedArray/StoredPackedArray<~lib/@btc-vision/as-bignum/assembly/integer/u256/u256>#ensureSlot|inlined.2
     local.get $3
     local.get $4
     i32.load offset=28
     i32.eq
     if
      local.get $4
      i32.load offset=32
      local.tee $1
      i32.eqz
      br_if $folding-inner0
      br $~lib/@btc-vision/btc-runtime/runtime/storage/arrays/StoredPackedArray/StoredPackedArray<~lib/@btc-vision/as-bignum/assembly/integer/u256/u256>#ensureSlot|inlined.2
     end
     local.get $4
     i32.load offset=20
     local.get $3
     call $"~lib/map/Map<u32,~lib/typedarray/Uint8Array>#has"
     if
      local.get $4
      i32.load offset=20
      local.get $3
      call $"~lib/map/Map<u32,~lib/typedarray/Uint8Array>#get"
      local.set $1
     else
      local.get $4
      local.get $3
      i64.extend_i32_u
      call $~lib/@btc-vision/btc-runtime/runtime/storage/arrays/StoredPackedArray/StoredPackedArray<~lib/@btc-vision/as-bignum/assembly/integer/u256/u256>#calculateStoragePointer@override
      local.set $1
      global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
      local.get $1
      call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#getStorageAt
      local.set $1
      local.get $4
      i32.load offset=20
      local.get $3
      local.get $1
      call $"~lib/map/Map<u32,~lib/typedarray/Uint8Array>#set"
     end
     local.get $4
     local.get $3
     i32.store offset=28
     local.get $4
     local.get $1
     i32.store offset=32
    end
    local.get $4
    local.get $4
    local.get $1
    call $~lib/@btc-vision/btc-runtime/runtime/storage/arrays/StoredPackedArray/StoredPackedArray<~lib/@btc-vision/as-bignum/assembly/integer/u256/u256>#unpackSlot@override
    local.tee $1
    i32.const 0
    call $~lib/array/Array<~lib/typedarray/Uint8Array>#__uget
    local.get $6
    call $~lib/@btc-vision/btc-runtime/runtime/storage/arrays/StoredPackedArray/StoredPackedArray<~lib/@btc-vision/as-bignum/assembly/integer/u256/u256>#eq@override
    i32.eqz
    if
     local.get $1
     i32.const 0
     local.get $6
     call $~lib/array/Array<~lib/typedarray/Uint8Array>#__set
     local.get $4
     local.get $1
     call $~lib/@btc-vision/btc-runtime/runtime/storage/arrays/StoredPackedArray/StoredPackedArray<~lib/@btc-vision/as-bignum/assembly/integer/u256/u256>#packSlot@override
     local.set $1
     local.get $4
     i32.load offset=20
     local.get $3
     local.get $1
     call $"~lib/map/Map<u32,~lib/typedarray/Uint8Array>#set"
     local.get $4
     i32.load offset=24
     local.get $3
     call $~lib/set/Set<u32>#add
     local.get $4
     local.get $3
     i32.store offset=28
     local.get $4
     local.get $1
     i32.store offset=32
    end
    local.get $0
    i32.load offset=96
    local.get $6
    block $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256.fromU32|inlined.5 (result i32)
     local.get $5
     i32.eqz
     if
      i64.const 0
      i64.const 0
      i64.const 0
      i64.const 0
      call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#constructor
      br $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256.fromU32|inlined.5
     end
     local.get $5
     i32.const 1
     i32.eq
     if
      i64.const 1
      i64.const 0
      i64.const 0
      i64.const 0
      call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#constructor
      br $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256.fromU32|inlined.5
     end
     local.get $5
     i64.extend_i32_u
     i64.const 0
     i64.const 0
     i64.const 0
     call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#constructor
    end
    call $~lib/@btc-vision/btc-runtime/runtime/storage/maps/StoredMapU256/StoredMapU256#set
   end
   local.get $4
   i32.load offset=8
   i32.eqz
   if
    i32.const 17824
    i32.const 14944
    i32.const 349
    i32.const 13
    call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
    unreachable
   end
   local.get $4
   i32.load offset=12
   local.get $4
   i32.load offset=8
   i32.const 1
   i32.sub
   i32.add
   local.get $4
   i32.load offset=52
   i32.rem_u
   local.set $3
   local.get $4
   call $~lib/@btc-vision/btc-runtime/runtime/storage/arrays/StoredPackedArray/StoredPackedArray<~lib/@btc-vision/as-bignum/assembly/integer/u256/u256>#getSlotCapacity@override
   block $~lib/@btc-vision/btc-runtime/runtime/storage/arrays/StoredPackedArray/StoredPackedArray<~lib/@btc-vision/as-bignum/assembly/integer/u256/u256>#ensureSlot|inlined.3
    local.get $3
    local.get $4
    i32.load offset=28
    i32.eq
    if
     local.get $4
     i32.load offset=32
     local.tee $1
     i32.eqz
     br_if $folding-inner0
     br $~lib/@btc-vision/btc-runtime/runtime/storage/arrays/StoredPackedArray/StoredPackedArray<~lib/@btc-vision/as-bignum/assembly/integer/u256/u256>#ensureSlot|inlined.3
    end
    local.get $4
    i32.load offset=20
    local.get $3
    call $"~lib/map/Map<u32,~lib/typedarray/Uint8Array>#has"
    if
     local.get $4
     i32.load offset=20
     local.get $3
     call $"~lib/map/Map<u32,~lib/typedarray/Uint8Array>#get"
     local.set $1
    else
     local.get $4
     local.get $3
     i64.extend_i32_u
     call $~lib/@btc-vision/btc-runtime/runtime/storage/arrays/StoredPackedArray/StoredPackedArray<~lib/@btc-vision/as-bignum/assembly/integer/u256/u256>#calculateStoragePointer@override
     local.set $1
     global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
     local.get $1
     call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#getStorageAt
     local.set $1
     local.get $4
     i32.load offset=20
     local.get $3
     local.get $1
     call $"~lib/map/Map<u32,~lib/typedarray/Uint8Array>#set"
    end
    local.get $4
    local.get $3
    i32.store offset=28
    local.get $4
    local.get $1
    i32.store offset=32
   end
   local.get $4
   local.get $1
   call $~lib/@btc-vision/btc-runtime/runtime/storage/arrays/StoredPackedArray/StoredPackedArray<~lib/@btc-vision/as-bignum/assembly/integer/u256/u256>#unpackSlot@override
   local.set $1
   block $__inlined_func$~lib/@btc-vision/btc-runtime/runtime/storage/arrays/StoredPackedArray/StoredPackedArray<~lib/@btc-vision/as-bignum/assembly/integer/u256/u256>#zeroValue@override$1156
    local.get $4
    i32.const 8
    i32.sub
    i32.load
    i32.const 52
    i32.eq
    if
     i64.const 0
     i64.const 0
     i64.const 0
     i64.const 0
     call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#constructor
     local.set $5
     br $__inlined_func$~lib/@btc-vision/btc-runtime/runtime/storage/arrays/StoredPackedArray/StoredPackedArray<~lib/@btc-vision/as-bignum/assembly/integer/u256/u256>#zeroValue@override$1156
    end
    unreachable
   end
   local.get $4
   local.get $1
   i32.const 0
   call $~lib/array/Array<~lib/typedarray/Uint8Array>#__uget
   local.get $5
   call $~lib/@btc-vision/btc-runtime/runtime/storage/arrays/StoredPackedArray/StoredPackedArray<~lib/@btc-vision/as-bignum/assembly/integer/u256/u256>#eq@override
   i32.eqz
   if
    local.get $1
    i32.const 0
    local.get $5
    call $~lib/array/Array<~lib/typedarray/Uint8Array>#__set
    local.get $4
    local.get $1
    call $~lib/@btc-vision/btc-runtime/runtime/storage/arrays/StoredPackedArray/StoredPackedArray<~lib/@btc-vision/as-bignum/assembly/integer/u256/u256>#packSlot@override
    local.set $1
    local.get $4
    i32.load offset=20
    local.get $3
    local.get $1
    call $"~lib/map/Map<u32,~lib/typedarray/Uint8Array>#set"
    local.get $4
    i32.load offset=24
    local.get $3
    call $~lib/set/Set<u32>#add
    local.get $4
    local.get $3
    i32.store offset=28
    local.get $4
    local.get $1
    i32.store offset=32
   end
   local.get $4
   local.get $4
   i32.load offset=8
   i32.const 1
   i32.sub
   i32.store offset=8
   local.get $4
   i32.const 1
   i32.store8 offset=16
   local.get $0
   i32.load offset=96
   local.get $2
   call $~lib/@btc-vision/btc-runtime/runtime/storage/maps/StoredMapU256/StoredMapU256#delete
   local.get $4
   call $~lib/@btc-vision/btc-runtime/runtime/storage/arrays/StoredPackedArray/StoredPackedArray<~lib/@btc-vision/as-bignum/assembly/integer/u256/u256>#save
   return
  end
  i32.const 9424
  i32.const 14944
  i32.const 527
  i32.const 32
  call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
  unreachable
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/types/SafeMath/SafeMath.sub (param $0 i32) (param $1 i32) (result i32)
  (local $2 i64)
  (local $3 i64)
  (local $4 i64)
  (local $5 i64)
  (local $6 i64)
  (local $7 i64)
  local.get $0
  local.get $1
  call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256.lt
  if
   i32.const 17936
   i32.const 8464
   i32.const 125
   i32.const 13
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $0
  i64.load
  local.tee $3
  local.get $1
  i64.load
  i64.sub
  local.set $2
  local.get $2
  local.get $3
  i64.gt_u
  i64.extend_i32_s
  global.set $~lib/@btc-vision/as-bignum/assembly/globals/__u256carrySub
  local.get $0
  i64.load offset=8
  local.tee $3
  local.get $1
  i64.load offset=8
  i64.sub
  local.tee $4
  global.get $~lib/@btc-vision/as-bignum/assembly/globals/__u256carrySub
  i64.sub
  local.set $5
  local.get $4
  local.get $5
  i64.lt_u
  local.get $3
  local.get $4
  i64.lt_u
  i32.add
  i64.extend_i32_s
  global.set $~lib/@btc-vision/as-bignum/assembly/globals/__u256carrySub
  local.get $0
  i64.load offset=16
  local.tee $4
  local.get $1
  i64.load offset=16
  i64.sub
  local.tee $6
  global.get $~lib/@btc-vision/as-bignum/assembly/globals/__u256carrySub
  i64.sub
  local.set $3
  local.get $4
  local.get $6
  i64.lt_u
  local.get $3
  local.get $6
  i64.gt_u
  i32.add
  i64.extend_i32_s
  global.set $~lib/@btc-vision/as-bignum/assembly/globals/__u256carrySub
  local.get $0
  i64.load offset=24
  local.tee $6
  local.get $1
  i64.load offset=24
  i64.sub
  local.tee $7
  global.get $~lib/@btc-vision/as-bignum/assembly/globals/__u256carrySub
  i64.sub
  local.set $4
  local.get $6
  local.get $7
  i64.lt_u
  local.get $4
  local.get $7
  i64.gt_u
  i32.add
  i64.extend_i32_s
  global.set $~lib/@btc-vision/as-bignum/assembly/globals/__u256carrySub
  local.get $2
  local.get $5
  local.get $3
  local.get $4
  call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#constructor
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#_transfer (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  (local $4 i32)
  (local $5 i32)
  local.get $1
  call $~lib/@btc-vision/btc-runtime/runtime/types/Address/Address.zero
  call $~lib/@btc-vision/btc-runtime/runtime/types/Address/Address#equals
  if
   i32.const 17104
   i32.const 14368
   i32.const 651
   i32.const 13
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $2
  call $~lib/@btc-vision/btc-runtime/runtime/types/Address/Address.zero
  call $~lib/@btc-vision/btc-runtime/runtime/types/Address/Address#equals
  if
   i32.const 17152
   i32.const 14368
   i32.const 655
   i32.const 13
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $0
  local.get $3
  call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#_ownerOf
  local.get $1
  call $~lib/@btc-vision/btc-runtime/runtime/types/Address/Address#notEquals
  if
   i32.const 17216
   i32.const 14368
   i32.const 661
   i32.const 13
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  block $folding-inner1
   block $folding-inner0
    global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
    local.tee $4
    i32.load offset=24
    i32.eqz
    br_if $folding-inner0
    local.get $4
    i32.load offset=24
    local.tee $4
    i32.eqz
    br_if $folding-inner1
    local.get $4
    i32.load offset=4
    local.tee $4
    local.get $1
    call $~lib/@btc-vision/btc-runtime/runtime/types/Address/Address#notEquals
    if (result i32)
     local.get $0
     local.get $1
     local.get $4
     call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#_isApprovedForAll
    else
     i32.const 1
    end
    i32.eqz
    if
     local.get $0
     i32.load offset=68
     local.get $3
     call $~lib/@btc-vision/btc-runtime/runtime/storage/maps/StoredMapU256/StoredMapU256#get
     call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#_addressFromU256
     local.get $4
     call $~lib/@btc-vision/btc-runtime/runtime/types/Address/Address#notEquals
     if
      i32.const 17504
      i32.const 14368
      i32.const 669
      i32.const 17
      call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
      unreachable
     end
    end
    local.get $0
    i32.load offset=68
    local.get $3
    call $~lib/@btc-vision/btc-runtime/runtime/storage/maps/StoredMapU256/StoredMapU256#delete
    local.get $0
    local.get $1
    local.get $3
    call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#_removeTokenFromOwnerEnumeration
    local.get $0
    local.get $2
    local.get $3
    call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#_addTokenToOwnerEnumeration
    local.get $0
    i32.load offset=72
    local.get $1
    call $~lib/@btc-vision/btc-runtime/runtime/memory/AddressMemoryMap/AddressMemoryMap#get
    local.set $4
    local.get $0
    i32.load offset=72
    local.get $1
    local.get $4
    i64.const 1
    i64.const 0
    i64.const 0
    i64.const 0
    call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#constructor
    call $~lib/@btc-vision/btc-runtime/runtime/types/SafeMath/SafeMath.sub
    call $~lib/@btc-vision/btc-runtime/runtime/memory/AddressMemoryMap/AddressMemoryMap#set
    local.get $0
    i32.load offset=72
    local.get $2
    call $~lib/@btc-vision/btc-runtime/runtime/memory/AddressMemoryMap/AddressMemoryMap#get
    local.set $4
    local.get $0
    i32.load offset=72
    local.get $2
    local.get $4
    i64.const 1
    i64.const 0
    i64.const 0
    i64.const 0
    call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#constructor
    call $~lib/@btc-vision/btc-runtime/runtime/types/SafeMath/SafeMath.add
    call $~lib/@btc-vision/btc-runtime/runtime/memory/AddressMemoryMap/AddressMemoryMap#set
    local.get $0
    i32.load offset=64
    local.get $3
    local.get $2
    call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#_u256FromAddress
    call $~lib/@btc-vision/btc-runtime/runtime/storage/maps/StoredMapU256/StoredMapU256#set
    global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
    local.tee $0
    i32.load offset=24
    i32.eqz
    br_if $folding-inner0
    local.get $0
    i32.load offset=24
    local.tee $0
    i32.eqz
    br_if $folding-inner1
    local.get $0
    i32.load offset=4
    local.set $4
    i32.const 12
    i32.const 67
    call $~lib/rt/stub/__new
    i32.const 128
    call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#constructor
    local.tee $0
    local.get $4
    call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeAddress
    local.get $0
    local.get $1
    call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeAddress
    local.get $0
    local.get $2
    call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeAddress
    local.get $0
    local.get $3
    call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeU256
    i32.const 18032
    local.get $0
    call $~lib/@btc-vision/btc-runtime/runtime/events/NetEvent/NetEvent#constructor
    call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP_NET/OP_NET#emitEvent
    return
   end
   i32.const 12704
   i32.const 5168
   i32.const 145
   i32.const 13
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  i32.const 9424
  i32.const 5168
  i32.const 147
  i32.const 16
  call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
  unreachable
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeBytesWithLength (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  local.get $0
  local.get $1
  i32.load offset=8
  local.tee $3
  i32.const 4
  i32.add
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#allocSafe
  local.get $0
  local.get $3
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeU32
  loop $for-loop|0
   local.get $2
   local.get $3
   i32.lt_u
   if
    local.get $0
    local.get $1
    local.get $2
    call $~lib/typedarray/Uint8Array#__get
    call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeU8
    local.get $2
    i32.const 1
    i32.add
    local.set $2
    br $for-loop|0
   end
  end
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#_checkOnOP721Received (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  (local $4 i32)
  (local $5 i32)
  local.get $3
  i32.load offset=8
  i32.const 104
  i32.add
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#constructor
  local.tee $4
  i32.const 1397356254
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeU32
  global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
  local.tee $5
  i32.load offset=24
  i32.eqz
  if
   i32.const 12704
   i32.const 5168
   i32.const 145
   i32.const 13
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $5
  i32.load offset=24
  local.tee $5
  i32.eqz
  if
   i32.const 9424
   i32.const 5168
   i32.const 147
   i32.const 16
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $4
  local.get $5
  i32.load offset=4
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeAddress
  local.get $4
  local.get $0
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeAddress
  local.get $4
  local.get $2
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeU256
  local.get $4
  local.get $3
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeBytesWithLength
  local.get $1
  i32.eqz
  if
   i32.const 18080
   i32.const 5168
   i32.const 400
   i32.const 13
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $1
  i32.load
  local.get $4
  i32.load offset=8
  i32.load
  local.get $4
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#bufferLength
  global.get $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/FOUR_BYTES_UINT8ARRAY_MEMORY_CACHE
  i32.load
  call $~lib/@btc-vision/btc-runtime/runtime/env/global/callContract
  local.set $0
  global.get $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/FOUR_BYTES_UINT8ARRAY_MEMORY_CACHE
  i32.load offset=4
  i32.load
  call $~lib/polyfills/bswap<u32>
  local.tee $1
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.set $2
  i32.const 0
  local.get $1
  local.get $2
  call $~lib/@btc-vision/btc-runtime/runtime/env/global/getCallResult
  local.get $0
  if
   local.get $0
   local.get $2
   local.get $1
   call $~lib/@btc-vision/btc-runtime/runtime/env/global/env_exit
  end
  i32.const 1
  global.set $~argumentsLength
  local.get $2
  call $~lib/typedarray/Uint8Array.wrap@varargs
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#constructor
  local.set $1
  i32.const 8
  i32.const 68
  call $~lib/rt/stub/__new
  local.tee $2
  local.get $0
  i32.eqz
  i32.store8
  local.get $2
  local.get $1
  i32.store offset=4
  local.get $2
  i32.load offset=4
  i32.load
  i32.load offset=8
  i32.const 4
  i32.lt_s
  if
   i32.const 18176
   i32.const 14368
   i32.const 801
   i32.const 13
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $2
  i32.load offset=4
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readU32
  i32.const 1397356254
  i32.ne
  if
   i32.const 18176
   i32.const 14368
   i32.const 806
   i32.const 13
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#_safeTransfer (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32)
  local.get $0
  local.get $1
  local.get $2
  local.get $3
  call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#_transfer
  local.get $2
  i32.load
  call $~lib/@btc-vision/btc-runtime/runtime/env/global/getAccountType
  if
   local.get $1
   local.get $2
   local.get $3
   local.get $4
   call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#_checkOnOP721Received
  end
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#_approve (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  local.get $1
  call $~lib/@btc-vision/btc-runtime/runtime/types/Address/Address.zero
  call $~lib/@btc-vision/btc-runtime/runtime/types/Address/Address#equals
  if
   i32.const 18256
   i32.const 14368
   i32.const 705
   i32.const 42
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $1
  local.get $0
  local.get $2
  call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#_ownerOf
  local.tee $3
  call $~lib/@btc-vision/btc-runtime/runtime/types/Address/Address#equals
  if
   i32.const 18336
   i32.const 14368
   i32.const 708
   i32.const 33
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  block $folding-inner1
   block $folding-inner0
    global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
    local.tee $4
    i32.load offset=24
    i32.eqz
    br_if $folding-inner0
    local.get $4
    i32.load offset=24
    local.tee $4
    i32.eqz
    br_if $folding-inner1
    local.get $3
    local.get $4
    i32.load offset=4
    call $~lib/@btc-vision/btc-runtime/runtime/types/Address/Address#notEquals
    if (result i32)
     global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
     local.tee $4
     i32.load offset=24
     i32.eqz
     br_if $folding-inner0
     local.get $4
     i32.load offset=24
     local.tee $4
     i32.eqz
     br_if $folding-inner1
     local.get $0
     local.get $3
     local.get $4
     i32.load offset=4
     call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#_isApprovedForAll
    else
     i32.const 1
    end
    i32.eqz
    if
     i32.const 18416
     i32.const 14368
     i32.const 714
     i32.const 13
     call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
     unreachable
    end
    local.get $0
    i32.load offset=68
    local.get $2
    local.get $1
    call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#_u256FromAddress
    call $~lib/@btc-vision/btc-runtime/runtime/storage/maps/StoredMapU256/StoredMapU256#set
    i32.const 12
    i32.const 69
    call $~lib/rt/stub/__new
    i32.const 96
    call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#constructor
    local.tee $4
    local.get $3
    call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeAddress
    local.get $4
    local.get $1
    call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeAddress
    local.get $4
    local.get $2
    call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeU256
    i32.const 18496
    local.get $4
    call $~lib/@btc-vision/btc-runtime/runtime/events/NetEvent/NetEvent#constructor
    call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP_NET/OP_NET#emitEvent
    return
   end
   i32.const 12704
   i32.const 5168
   i32.const 145
   i32.const 13
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  i32.const 9424
  i32.const 5168
  i32.const 147
  i32.const 16
  call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
  unreachable
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readBoolean (param $0 i32) (result i32)
  local.get $0
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readU8
  i32.const 0
  i32.ne
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#_setApprovalForAll (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  local.get $0
  i32.load offset=76
  local.tee $4
  local.get $1
  call $"~lib/@btc-vision/btc-runtime/runtime/generic/Map/Map<~lib/@btc-vision/btc-runtime/runtime/types/Address/Address,~lib/@btc-vision/btc-runtime/runtime/memory/Nested/Nested<~lib/@btc-vision/as-bignum/assembly/integer/u256/u256>>#indexOf@override"
  i32.const -1
  i32.eq
  if
   local.get $4
   local.get $1
   local.get $1
   local.get $4
   i32.load16_u offset=12
   call $~lib/@btc-vision/btc-runtime/runtime/memory/Nested/Nested<~lib/@btc-vision/as-bignum/assembly/integer/u256/u256>#constructor
   call $"~lib/@btc-vision/btc-runtime/runtime/generic/Map/Map<~lib/@btc-vision/btc-runtime/runtime/types/Address/Address,~lib/@btc-vision/btc-runtime/runtime/memory/Nested/Nested<~lib/@btc-vision/as-bignum/assembly/integer/u256/u256>>#set"
   drop
  end
  local.get $4
  local.get $1
  call $"~lib/@btc-vision/btc-runtime/runtime/generic/Map/Map<~lib/@btc-vision/btc-runtime/runtime/types/Address/Address,~lib/@btc-vision/btc-runtime/runtime/memory/Nested/Nested<~lib/@btc-vision/as-bignum/assembly/integer/u256/u256>>#get"
  local.set $6
  local.get $3
  if (result i32)
   i64.const 1
   i64.const 0
   i64.const 0
   i64.const 0
   call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#constructor
  else
   i64.const 0
   i64.const 0
   i64.const 0
   i64.const 0
   call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#constructor
  end
  local.set $4
  local.get $6
  local.get $2
  call $~lib/@btc-vision/btc-runtime/runtime/memory/Nested/Nested<~lib/@btc-vision/as-bignum/assembly/integer/u256/u256>#getKeyHash
  local.set $5
  global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
  local.get $5
  i32.const 0
  i32.const 32
  call $~lib/typedarray/Uint8Array#constructor
  local.tee $7
  i32.load offset=4
  local.tee $5
  local.get $4
  i64.load offset=24
  call $~lib/polyfills/bswap<u64>
  i64.store
  local.get $5
  local.get $4
  i64.load offset=16
  call $~lib/polyfills/bswap<u64>
  i64.store offset=8
  local.get $5
  local.get $4
  i64.load offset=8
  call $~lib/polyfills/bswap<u64>
  i64.store offset=16
  local.get $5
  local.get $4
  i64.load
  call $~lib/polyfills/bswap<u64>
  i64.store offset=24
  local.get $7
  call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#_internalSetStorageAt
  local.get $0
  i32.load offset=76
  local.tee $0
  local.get $1
  call $"~lib/@btc-vision/btc-runtime/runtime/generic/Map/Map<~lib/@btc-vision/btc-runtime/runtime/types/Address/Address,~lib/@btc-vision/btc-runtime/runtime/memory/Nested/Nested<~lib/@btc-vision/as-bignum/assembly/integer/u256/u256>>#indexOf@override"
  i32.const -1
  i32.eq
  if
   local.get $0
   local.get $1
   local.get $1
   local.get $0
   i32.load16_u offset=12
   call $~lib/@btc-vision/btc-runtime/runtime/memory/Nested/Nested<~lib/@btc-vision/as-bignum/assembly/integer/u256/u256>#constructor
   call $"~lib/@btc-vision/btc-runtime/runtime/generic/Map/Map<~lib/@btc-vision/btc-runtime/runtime/types/Address/Address,~lib/@btc-vision/btc-runtime/runtime/memory/Nested/Nested<~lib/@btc-vision/as-bignum/assembly/integer/u256/u256>>#set"
   drop
  end
  local.get $0
  local.get $1
  local.get $6
  call $"~lib/@btc-vision/btc-runtime/runtime/generic/Map/Map<~lib/@btc-vision/btc-runtime/runtime/types/Address/Address,~lib/@btc-vision/btc-runtime/runtime/memory/Nested/Nested<~lib/@btc-vision/as-bignum/assembly/integer/u256/u256>>#set"
  i32.const 8
  i32.sub
  i32.load
  i32.const 45
  i32.ne
  if
   i32.const 18608
   i32.const 18672
   i32.const 26
   i32.const 22
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  i32.const 12
  i32.const 70
  call $~lib/rt/stub/__new
  i32.const 65
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#constructor
  local.tee $4
  local.get $1
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeAddress
  local.get $4
  local.get $2
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeAddress
  local.get $4
  local.get $3
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeBoolean
  i32.const 18816
  local.get $4
  call $~lib/@btc-vision/btc-runtime/runtime/events/NetEvent/NetEvent#constructor
  call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP_NET/OP_NET#emitEvent
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeBytesU8Array (param $0 i32) (param $1 i32)
  (local $2 i32)
  local.get $0
  local.get $1
  i32.load offset=12
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#allocSafe
  loop $for-loop|0
   local.get $2
   local.get $1
   i32.load offset=12
   i32.lt_s
   if
    local.get $2
    local.get $1
    i32.load offset=12
    i32.ge_u
    if
     i32.const 2176
     i32.const 4192
     i32.const 116
     i32.const 42
     call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
     unreachable
    end
    local.get $0
    local.get $1
    i32.load offset=4
    local.get $2
    i32.add
    i32.load8_u
    call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeU8
    local.get $2
    i32.const 1
    i32.add
    local.set $2
    br $for-loop|0
   end
  end
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeU64 (param $0 i32) (param $1 i64)
  (local $2 i32)
  (local $3 i32)
  local.get $0
  i32.const 8
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#allocSafe
  local.get $0
  i32.load
  local.tee $2
  i32.const 31
  i32.shr_u
  local.get $0
  i32.load offset=4
  local.tee $3
  i32.load offset=8
  local.get $2
  i32.const 8
  i32.add
  i32.lt_s
  i32.or
  if
   i32.const 2176
   i32.const 2416
   i32.const 174
   i32.const 7
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $2
  local.get $3
  i32.load offset=4
  i32.add
  local.get $1
  call $~lib/polyfills/bswap<u64>
  i64.store
  local.get $0
  local.get $0
  i32.load
  i32.const 8
  i32.add
  i32.store
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#_buildDomainSeparator (param $0 i32) (result i32)
  (local $1 i32)
  i32.const 192
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#constructor
  local.tee $1
  i32.const 4592
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeBytesU8Array
  local.get $0
  call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#get:name
  i32.const 1
  global.set $~argumentsLength
  call $~lib/string/String.UTF8.encode@varargs
  local.set $0
  i32.const 1
  global.set $~argumentsLength
  local.get $1
  local.get $0
  call $~lib/typedarray/Uint8Array.wrap@varargs
  call $~lib/@btc-vision/btc-runtime/runtime/env/global/sha256
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeBytes
  local.get $1
  i32.const 4704
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeBytesU8Array
  local.get $1
  global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
  call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#get:chainId
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeBytes
  global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
  local.tee $0
  i32.load offset=48
  i32.eqz
  if
   i32.const 19136
   i32.const 5168
   i32.const 264
   i32.const 13
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $0
  i32.load offset=48
  local.tee $0
  i32.eqz
  if
   i32.const 9424
   i32.const 5168
   i32.const 266
   i32.const 16
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $1
  local.get $0
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeBytes
  global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
  local.tee $0
  i32.load offset=40
  i32.eqz
  if
   i32.const 19216
   i32.const 5168
   i32.const 231
   i32.const 13
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $0
  i32.load offset=40
  local.tee $0
  i32.eqz
  if
   i32.const 9424
   i32.const 5168
   i32.const 233
   i32.const 16
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $1
  local.get $0
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeAddress
  local.get $1
  i32.load offset=8
  call $~lib/@btc-vision/btc-runtime/runtime/env/global/sha256
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#_verifySignature (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  i32.const 66
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#constructor
  local.tee $5
  i32.const 2
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#allocSafe
  local.get $5
  i32.load
  local.tee $6
  i32.const 31
  i32.shr_u
  local.get $5
  i32.load offset=4
  local.tee $7
  i32.load offset=8
  local.get $6
  i32.const 2
  i32.add
  i32.lt_s
  i32.or
  if
   i32.const 2176
   i32.const 2416
   i32.const 135
   i32.const 7
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $6
  local.get $7
  i32.load offset=4
  i32.add
  i32.const 6401
  call $~lib/polyfills/bswap<u16>
  i32.store16
  local.get $5
  local.get $5
  i32.load
  i32.const 2
  i32.add
  i32.store
  local.get $5
  local.get $0
  call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#_buildDomainSeparator
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeBytes
  local.get $5
  local.get $1
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeBytes
  local.get $5
  i32.load offset=8
  call $~lib/@btc-vision/btc-runtime/runtime/env/global/sha256
  local.set $1
  i32.const 3
  global.set $~argumentsLength
  global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
  local.tee $5
  i32.load offset=24
  i32.eqz
  if
   i32.const 12704
   i32.const 5168
   i32.const 145
   i32.const 13
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $5
  i32.load offset=24
  local.tee $5
  i32.eqz
  if
   i32.const 9424
   i32.const 5168
   i32.const 147
   i32.const 16
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $5
  i32.load
  i64.load
  i64.const 1
  i64.and
  i32.wrap_i64
  if (result i32)
   local.get $3
   i32.load offset=8
   i32.const 64
   i32.ne
   if
    i32.const 19296
    i32.const 5168
    i32.const 1307
    i32.const 38
    call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
    unreachable
   end
   local.get $1
   i32.load offset=8
   i32.const 32
   i32.ne
   if
    i32.const 19376
    i32.const 5168
    i32.const 1308
    i32.const 33
    call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
    unreachable
   end
   i32.const 0
   i32.const 33
   call $~lib/typedarray/Uint8Array#constructor
   local.tee $5
   i32.load offset=4
   local.tee $6
   i32.const 1
   i32.store8
   local.get $6
   i32.const 1
   i32.add
   local.get $2
   i32.load offset=20
   i32.load offset=4
   i32.const 32
   memory.copy
   local.get $5
   i32.load
   local.get $3
   i32.load
   local.get $1
   i32.load
   call $~lib/@btc-vision/btc-runtime/runtime/env/global/verifySignature
   i32.const 1
   i32.eq
  else
   local.get $2
   i32.load offset=16
   i32.eqz
   if
    i32.const 0
    i32.const 33
    call $~lib/typedarray/Uint8Array#constructor
    local.tee $5
    i32.load offset=4
    local.tee $6
    i32.const 0
    i32.store8
    local.get $6
    i32.const 1
    i32.add
    local.get $2
    i32.load offset=4
    i32.const 32
    memory.copy
    i32.const 0
    i32.const 1313
    call $~lib/typedarray/Uint8Array#constructor
    local.set $6
    local.get $5
    i32.load
    local.get $6
    i32.load
    call $~lib/@btc-vision/btc-runtime/runtime/env/global/loadMLDSA
    local.get $6
    i32.load offset=4
    i32.load8_u
    i32.eqz
    if
     i32.const 19952
     i32.const 20032
     i32.const 377
     i32.const 9
     call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
     unreachable
    end
    i32.const 1
    global.set $~argumentsLength
    local.get $2
    local.get $6
    i32.const 1
    call $~lib/typedarray/Uint8Array#slice@varargs
    i32.store offset=16
   end
   local.get $2
   i32.load offset=16
   local.tee $5
   i32.eqz
   if
    i32.const 9424
    i32.const 2752
    i32.const 87
    i32.const 16
    call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
    unreachable
   end
   local.get $5
   i32.load offset=8
   i32.const 1312
   i32.ne
   if
    i32.const 20160
    i32.const 5168
    i32.const 867
    i32.const 13
    call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
    unreachable
   end
   local.get $3
   i32.load offset=8
   i32.const 2420
   i32.ne
   if
    i32.const 20256
    i32.const 5168
    i32.const 871
    i32.const 13
    call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
    unreachable
   end
   local.get $1
   i32.load offset=8
   i32.const 32
   i32.ne
   if
    i32.const 19376
    i32.const 5168
    i32.const 875
    i32.const 13
    call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
    unreachable
   end
   i32.const 0
   local.get $5
   i32.load offset=8
   i32.const 2
   i32.add
   call $~lib/typedarray/Uint8Array#constructor
   local.tee $6
   i32.load offset=4
   local.tee $7
   i32.const 2
   i32.store8
   local.get $7
   i32.const 0
   i32.store8 offset=1
   local.get $7
   i32.const 2
   i32.add
   local.get $5
   i32.load offset=4
   local.get $5
   i32.load offset=8
   memory.copy
   local.get $6
   i32.load
   local.get $3
   i32.load
   local.get $1
   i32.load
   call $~lib/@btc-vision/btc-runtime/runtime/env/global/verifySignature
   i32.const 1
   i32.eq
  end
  i32.eqz
  if
   i32.const 20544
   i32.const 14368
   i32.const 884
   i32.const 13
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $0
  i32.load offset=80
  local.get $2
  local.get $4
  i64.const 1
  i64.const 0
  i64.const 0
  i64.const 0
  call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#constructor
  call $~lib/@btc-vision/btc-runtime/runtime/types/SafeMath/SafeMath.add
  call $~lib/@btc-vision/btc-runtime/runtime/memory/AddressMemoryMap/AddressMemoryMap#set
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#_verifyApproveSignature (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i64) (param $5 i32)
  (local $6 i32)
  (local $7 i32)
  local.get $5
  i32.load offset=8
  i32.const 64
  i32.ne
  if
   i32.const 18928
   i32.const 14368
   i32.const 818
   i32.const 13
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
  local.tee $6
  i32.load offset=20
  i32.eqz
  if
   i32.const 19008
   i32.const 5168
   i32.const 118
   i32.const 13
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $6
  i32.load offset=20
  local.tee $6
  i32.eqz
  if
   i32.const 9424
   i32.const 5168
   i32.const 120
   i32.const 16
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $4
  local.get $6
  i64.load offset=8
  i64.lt_u
  if
   i32.const 19072
   i32.const 14368
   i32.const 821
   i32.const 13
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $0
  i32.load offset=80
  local.get $1
  call $~lib/@btc-vision/btc-runtime/runtime/memory/AddressMemoryMap/AddressMemoryMap#get
  local.set $7
  i32.const 168
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#constructor
  local.tee $6
  i32.const 4816
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeBytesU8Array
  local.get $6
  local.get $1
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeAddress
  local.get $6
  local.get $2
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeAddress
  local.get $6
  local.get $3
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeU256
  local.get $6
  local.get $7
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeU256
  local.get $6
  local.get $4
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeU64
  local.get $0
  local.get $6
  i32.load offset=8
  call $~lib/@btc-vision/btc-runtime/runtime/env/global/sha256
  local.get $1
  local.get $5
  local.get $7
  call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#_verifySignature
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#approveBySignature (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i64)
  (local $4 i32)
  (local $5 i32)
  i32.const 32
  call $~lib/array/Array<u8>#constructor
  local.set $4
  loop $for-loop|0
   local.get $2
   i32.const 32
   i32.lt_s
   if
    local.get $4
    local.get $2
    local.get $1
    call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readU8
    call $~lib/array/Array<u8>#__set
    local.get $2
    i32.const 1
    i32.add
    local.set $2
    br $for-loop|0
   end
  end
  i32.const 32
  call $~lib/array/Array<u8>#constructor
  local.set $5
  i32.const 0
  local.set $2
  loop $for-loop|1
   local.get $2
   i32.const 32
   i32.lt_s
   if
    local.get $5
    local.get $2
    local.get $1
    call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readU8
    call $~lib/array/Array<u8>#__set
    local.get $2
    i32.const 1
    i32.add
    local.set $2
    br $for-loop|1
   end
  end
  local.get $5
  local.get $4
  call $~lib/@btc-vision/btc-runtime/runtime/types/ExtendedAddress/ExtendedAddress#constructor
  local.set $2
  local.get $1
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readAddress
  local.set $4
  local.get $1
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readU256
  local.set $5
  local.get $1
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readU64
  local.set $3
  local.get $1
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readBytesWithLength
  local.set $1
  local.get $0
  local.get $5
  call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#_ownerOf
  local.get $2
  call $~lib/@btc-vision/btc-runtime/runtime/types/Address/Address#notEquals
  if
   i32.const 18864
   i32.const 14368
   i32.const 429
   i32.const 35
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $0
  local.get $2
  local.get $4
  local.get $5
  local.get $3
  local.get $1
  call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#_verifyApproveSignature
  local.get $0
  local.get $4
  local.get $5
  call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#_approve
  i32.const 0
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#constructor
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#_verifySetApprovalForAllSignature (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i64) (param $5 i32)
  (local $6 i32)
  (local $7 i32)
  local.get $5
  i32.load offset=8
  i32.const 64
  i32.ne
  if
   i32.const 18928
   i32.const 14368
   i32.const 848
   i32.const 13
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
  local.tee $6
  i32.load offset=20
  i32.eqz
  if
   i32.const 19008
   i32.const 5168
   i32.const 118
   i32.const 13
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $6
  i32.load offset=20
  local.tee $6
  i32.eqz
  if
   i32.const 9424
   i32.const 5168
   i32.const 120
   i32.const 16
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $4
  local.get $6
  i64.load offset=8
  i64.lt_u
  if
   i32.const 19072
   i32.const 14368
   i32.const 851
   i32.const 13
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $0
  i32.load offset=80
  local.get $1
  call $~lib/@btc-vision/btc-runtime/runtime/memory/AddressMemoryMap/AddressMemoryMap#get
  local.set $7
  i32.const 137
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#constructor
  local.tee $6
  i32.const 4928
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeBytesU8Array
  local.get $6
  local.get $1
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeAddress
  local.get $6
  local.get $2
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeAddress
  local.get $6
  local.get $3
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeBoolean
  local.get $6
  local.get $7
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeU256
  local.get $6
  local.get $4
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeU64
  local.get $0
  local.get $6
  i32.load offset=8
  call $~lib/@btc-vision/btc-runtime/runtime/env/global/sha256
  local.get $1
  local.get $5
  local.get $7
  call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#_verifySignature
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#setApprovalForAllBySignature (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i64)
  (local $4 i32)
  (local $5 i32)
  i32.const 32
  call $~lib/array/Array<u8>#constructor
  local.set $4
  loop $for-loop|0
   local.get $2
   i32.const 32
   i32.lt_s
   if
    local.get $4
    local.get $2
    local.get $1
    call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readU8
    call $~lib/array/Array<u8>#__set
    local.get $2
    i32.const 1
    i32.add
    local.set $2
    br $for-loop|0
   end
  end
  i32.const 32
  call $~lib/array/Array<u8>#constructor
  local.set $5
  i32.const 0
  local.set $2
  loop $for-loop|1
   local.get $2
   i32.const 32
   i32.lt_s
   if
    local.get $5
    local.get $2
    local.get $1
    call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readU8
    call $~lib/array/Array<u8>#__set
    local.get $2
    i32.const 1
    i32.add
    local.set $2
    br $for-loop|1
   end
  end
  local.get $5
  local.get $4
  call $~lib/@btc-vision/btc-runtime/runtime/types/ExtendedAddress/ExtendedAddress#constructor
  local.set $2
  local.get $1
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readAddress
  local.set $4
  local.get $1
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readBoolean
  local.set $5
  local.get $1
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readU64
  local.set $3
  local.get $1
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readBytesWithLength
  local.set $1
  local.get $2
  local.get $4
  call $~lib/@btc-vision/btc-runtime/runtime/types/Address/Address#equals
  if
   i32.const 18544
   i32.const 14368
   i32.const 458
   i32.const 33
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $0
  local.get $2
  local.get $4
  local.get $5
  local.get $3
  local.get $1
  call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#_verifySetApprovalForAllSignature
  local.get $0
  local.get $2
  local.get $4
  local.get $5
  call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#_setApprovalForAll
  i32.const 0
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#constructor
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#_burn (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  local.get $0
  local.get $1
  call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#_ownerOf
  local.set $2
  block $folding-inner1
   block $folding-inner0
    global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
    local.tee $3
    i32.load offset=24
    i32.eqz
    br_if $folding-inner0
    local.get $3
    i32.load offset=24
    local.tee $3
    i32.eqz
    br_if $folding-inner1
    local.get $2
    local.get $3
    i32.load offset=4
    call $~lib/@btc-vision/btc-runtime/runtime/types/Address/Address#notEquals
    if (result i32)
     global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
     local.tee $3
     i32.load offset=24
     i32.eqz
     br_if $folding-inner0
     local.get $3
     i32.load offset=24
     local.tee $3
     i32.eqz
     br_if $folding-inner1
     local.get $0
     local.get $2
     local.get $3
     i32.load offset=4
     call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#_isApprovedForAll
    else
     i32.const 1
    end
    i32.eqz
    if
     local.get $0
     i32.load offset=68
     local.get $1
     call $~lib/@btc-vision/btc-runtime/runtime/storage/maps/StoredMapU256/StoredMapU256#get
     call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#_addressFromU256
     global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
     local.tee $4
     i32.load offset=24
     i32.eqz
     br_if $folding-inner0
     local.get $4
     i32.load offset=24
     local.tee $4
     i32.eqz
     br_if $folding-inner1
     local.get $4
     i32.load offset=4
     call $~lib/@btc-vision/btc-runtime/runtime/types/Address/Address#notEquals
     if
      i32.const 20608
      i32.const 14368
      i32.const 620
      i32.const 17
      call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
      unreachable
     end
    end
    local.get $0
    i32.load offset=68
    local.get $1
    call $~lib/@btc-vision/btc-runtime/runtime/storage/maps/StoredMapU256/StoredMapU256#delete
    local.get $0
    local.get $2
    local.get $1
    call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#_removeTokenFromOwnerEnumeration
    local.get $0
    i32.load offset=72
    local.get $2
    call $~lib/@btc-vision/btc-runtime/runtime/memory/AddressMemoryMap/AddressMemoryMap#get
    local.set $3
    local.get $0
    i32.load offset=72
    local.get $2
    local.get $3
    i64.const 1
    i64.const 0
    i64.const 0
    i64.const 0
    call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#constructor
    call $~lib/@btc-vision/btc-runtime/runtime/types/SafeMath/SafeMath.sub
    call $~lib/@btc-vision/btc-runtime/runtime/memory/AddressMemoryMap/AddressMemoryMap#set
    local.get $0
    i32.load offset=64
    local.get $1
    call $~lib/@btc-vision/btc-runtime/runtime/storage/maps/StoredMapU256/StoredMapU256#delete
    local.get $0
    i32.load offset=84
    local.get $1
    call $~lib/@btc-vision/btc-runtime/runtime/storage/maps/StoredMapU256/StoredMapU256#get
    local.tee $3
    i64.load offset=24
    local.get $3
    i64.load offset=16
    local.get $3
    i64.load
    local.get $3
    i64.load offset=8
    i64.or
    i64.or
    i64.or
    i64.eqz
    i32.eqz
    if
     local.get $0
     i32.load offset=84
     local.get $1
     call $~lib/@btc-vision/btc-runtime/runtime/storage/maps/StoredMapU256/StoredMapU256#delete
    end
    local.get $0
    i32.load offset=44
    local.get $0
    i32.load offset=44
    call $~lib/@btc-vision/btc-runtime/runtime/storage/StoredU256/StoredU256#get:value
    i64.const 1
    i64.const 0
    i64.const 0
    i64.const 0
    call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#constructor
    call $~lib/@btc-vision/btc-runtime/runtime/types/SafeMath/SafeMath.sub
    call $~lib/@btc-vision/btc-runtime/runtime/storage/StoredU256/StoredU256#set:value
    i32.const 12
    i32.const 71
    call $~lib/rt/stub/__new
    i32.const 64
    call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#constructor
    local.tee $3
    local.get $2
    call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeAddress
    local.get $3
    local.get $1
    call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeU256
    i32.const 20672
    local.get $3
    call $~lib/@btc-vision/btc-runtime/runtime/events/NetEvent/NetEvent#constructor
    call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP_NET/OP_NET#emitEvent
    return
   end
   i32.const 12704
   i32.const 5168
   i32.const 145
   i32.const 13
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  i32.const 9424
  i32.const 5168
  i32.const 147
  i32.const 16
  call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
  unreachable
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#tokenOfOwnerByIndex (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $1
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readAddress
  local.set $2
  local.get $1
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readU256
  local.tee $1
  local.get $0
  local.get $2
  call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#_balanceOf
  call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256.lt
  i32.eqz
  if
   i32.const 20704
   i32.const 14368
   i32.const 493
   i32.const 31
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $0
  local.get $2
  call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#_getOwnerTokenArray
  local.set $0
  local.get $1
  i64.load
  i32.wrap_i64
  local.tee $1
  local.get $0
  i32.load offset=52
  i32.ge_u
  if
   i32.const 17648
   i32.const 14944
   i32.const 110
   i32.const 13
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $0
  i32.load offset=12
  local.get $1
  i32.add
  local.get $0
  i32.load offset=52
  i32.rem_u
  local.set $2
  local.get $0
  call $~lib/@btc-vision/btc-runtime/runtime/storage/arrays/StoredPackedArray/StoredPackedArray<~lib/@btc-vision/as-bignum/assembly/integer/u256/u256>#getSlotCapacity@override
  block $~lib/@btc-vision/btc-runtime/runtime/storage/arrays/StoredPackedArray/StoredPackedArray<~lib/@btc-vision/as-bignum/assembly/integer/u256/u256>#ensureSlot|inlined.4
   local.get $2
   local.get $0
   i32.load offset=28
   i32.eq
   if
    local.get $0
    i32.load offset=32
    local.tee $1
    i32.eqz
    if
     i32.const 9424
     i32.const 14944
     i32.const 527
     i32.const 32
     call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
     unreachable
    end
    br $~lib/@btc-vision/btc-runtime/runtime/storage/arrays/StoredPackedArray/StoredPackedArray<~lib/@btc-vision/as-bignum/assembly/integer/u256/u256>#ensureSlot|inlined.4
   end
   local.get $0
   i32.load offset=20
   local.get $2
   call $"~lib/map/Map<u32,~lib/typedarray/Uint8Array>#has"
   if
    local.get $0
    i32.load offset=20
    local.get $2
    call $"~lib/map/Map<u32,~lib/typedarray/Uint8Array>#get"
    local.set $1
   else
    local.get $0
    local.get $2
    i64.extend_i32_u
    call $~lib/@btc-vision/btc-runtime/runtime/storage/arrays/StoredPackedArray/StoredPackedArray<~lib/@btc-vision/as-bignum/assembly/integer/u256/u256>#calculateStoragePointer@override
    local.set $1
    global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
    local.get $1
    call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#getStorageAt
    local.set $1
    local.get $0
    i32.load offset=20
    local.get $2
    local.get $1
    call $"~lib/map/Map<u32,~lib/typedarray/Uint8Array>#set"
   end
   local.get $0
   local.get $2
   i32.store offset=28
   local.get $0
   local.get $1
   i32.store offset=32
  end
  local.get $0
  local.get $1
  call $~lib/@btc-vision/btc-runtime/runtime/storage/arrays/StoredPackedArray/StoredPackedArray<~lib/@btc-vision/as-bignum/assembly/integer/u256/u256>#unpackSlot@override
  i32.const 0
  call $~lib/array/Array<~lib/typedarray/Uint8Array>#__uget
  local.set $0
  i32.const 32
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#constructor
  local.tee $1
  local.get $0
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeU256
  local.get $1
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#metadata (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  local.get $0
  call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#get:name
  local.set $1
  local.get $0
  call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#get:symbol
  local.set $2
  local.get $0
  i32.load offset=32
  call $~lib/@btc-vision/btc-runtime/runtime/storage/BaseStoredString/BaseStoredString#get:value
  local.set $3
  local.get $0
  i32.load offset=28
  call $~lib/@btc-vision/btc-runtime/runtime/storage/BaseStoredString/BaseStoredString#get:value
  local.set $4
  local.get $0
  i32.load offset=36
  call $~lib/@btc-vision/btc-runtime/runtime/storage/BaseStoredString/BaseStoredString#get:value
  local.set $5
  local.get $0
  i32.load offset=40
  call $~lib/@btc-vision/btc-runtime/runtime/storage/BaseStoredString/BaseStoredString#get:value
  local.set $6
  local.get $0
  call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#_buildDomainSeparator
  local.set $7
  local.get $1
  call $~lib/string/String.UTF8.byteLength
  local.set $12
  local.get $2
  call $~lib/string/String.UTF8.byteLength
  local.set $13
  local.get $3
  call $~lib/string/String.UTF8.byteLength
  local.set $8
  local.get $4
  call $~lib/string/String.UTF8.byteLength
  local.set $9
  local.get $5
  call $~lib/string/String.UTF8.byteLength
  local.set $10
  local.get $6
  call $~lib/string/String.UTF8.byteLength
  local.set $11
  local.get $7
  i32.load offset=8
  local.get $12
  local.get $13
  i32.add
  local.get $8
  i32.add
  local.get $9
  i32.add
  local.get $10
  i32.add
  local.get $11
  i32.add
  i32.const 92
  i32.add
  i32.add
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#constructor
  local.tee $8
  local.get $1
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeStringWithLength
  local.get $8
  local.get $2
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeStringWithLength
  local.get $8
  local.get $3
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeStringWithLength
  local.get $8
  local.get $4
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeStringWithLength
  local.get $8
  local.get $5
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeStringWithLength
  local.get $8
  local.get $6
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeStringWithLength
  local.get $8
  local.get $0
  call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#get:totalSupply
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeU256
  local.get $8
  local.get $0
  call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#get:maxSupply
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeU256
  local.get $8
  local.get $7
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeBytesWithLength
  local.get $8
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#execute (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  block $folding-inner7
   block $folding-inner6
    block $folding-inner5
     block $folding-inner4
      local.get $1
      i32.const 360839196
      i32.eq
      if
       local.get $0
       call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#get:name
       local.tee $0
       call $~lib/string/String.UTF8.byteLength
       i32.const 4
       i32.add
       call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#constructor
       local.tee $1
       local.get $0
       call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeStringWithLength
       br $folding-inner4
      end
      local.get $1
      i32.const 630619301
      i32.eq
      if
       local.get $0
       call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#get:symbol
       local.tee $0
       call $~lib/string/String.UTF8.byteLength
       i32.const 4
       i32.add
       call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#constructor
       local.tee $1
       local.get $0
       call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeStringWithLength
       br $folding-inner4
      end
      local.get $1
      i32.const -2070859664
      i32.eq
      if
       i32.const 32
       call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#constructor
       local.tee $1
       local.get $0
       call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#get:maxSupply
       call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeU256
       br $folding-inner4
      end
      local.get $1
      i32.const -1345001860
      i32.eq
      if
       block $__inlined_func$~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#tokenURI@override$1411
        local.get $0
        i32.const 8
        i32.sub
        i32.load
        i32.const 35
        i32.eq
        if
         local.get $0
         local.get $2
         call $op721/DopamilioNFT/DopamilioNFT#tokenURI
         local.set $0
         br $__inlined_func$~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#tokenURI@override$1411
        end
        local.get $0
        local.get $2
        call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readU256
        local.tee $1
        call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#_exists
        i32.eqz
        if
         i32.const 16656
         i32.const 14368
         i32.const 212
         i32.const 37
         call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
         unreachable
        end
        local.get $0
        i32.load offset=84
        local.get $1
        call $~lib/@btc-vision/btc-runtime/runtime/storage/maps/StoredMapU256/StoredMapU256#get
        local.tee $2
        i64.load offset=24
        local.get $2
        i64.load offset=16
        local.get $2
        i64.load
        local.get $2
        i64.load offset=8
        i64.or
        i64.or
        i64.or
        i64.eqz
        if (result i32)
         local.get $0
         call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#get:baseURI
         local.get $1
         call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#toString
         call $~lib/string/String#concat
        else
         local.get $0
         i32.load offset=88
         local.get $2
         i64.load
         i32.wrap_i64
         local.tee $1
         call $"~lib/map/Map<u32,~lib/typedarray/Uint8Array>#has"
         i32.eqz
         if
          global.get $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/tokenURIMapPointer
          local.get $1
          i64.extend_i32_u
          call $~lib/@btc-vision/btc-runtime/runtime/storage/StoredString/StoredString#constructor
          local.set $2
          local.get $0
          i32.load offset=88
          local.get $1
          local.get $2
          call $"~lib/map/Map<u32,~lib/typedarray/Uint8Array>#set"
         end
         local.get $0
         i32.load offset=88
         local.get $1
         call $"~lib/map/Map<u32,~lib/typedarray/Uint8Array>#get"
         call $~lib/@btc-vision/btc-runtime/runtime/storage/BaseStoredString/BaseStoredString#get:value
        end
        local.tee $1
        call $~lib/string/String.UTF8.byteLength
        i32.const 4
        i32.add
        call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#constructor
        local.tee $0
        local.get $1
        call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeStringWithLength
       end
       local.get $0
       return
      end
      local.get $1
      i32.const 1260247291
      i32.eq
      if
       local.get $0
       local.get $2
       call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#changeMetadata
       return
      end
      local.get $1
      i32.const -1553464786
      i32.eq
      if
       i32.const 32
       call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#constructor
       local.tee $1
       local.get $0
       call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#get:totalSupply
       call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeU256
       br $folding-inner4
      end
      block $folding-inner3
       block $folding-inner2
        local.get $1
        i32.const 1531377910
        i32.eq
        if
         local.get $0
         local.get $2
         call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readAddress
         call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#_balanceOf
         local.set $0
         br $folding-inner2
        end
        local.get $1
        i32.const 116840091
        i32.eq
        if
         local.get $0
         local.get $2
         call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readU256
         call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#_ownerOf
         local.set $0
         br $folding-inner3
        end
        block $folding-inner1
         local.get $1
         i32.const 998829911
         i32.eq
         if
          local.get $2
          call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readAddress
          local.set $1
          local.get $2
          call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readU256
          local.set $2
          global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
          local.tee $3
          i32.load offset=24
          i32.eqz
          br_if $folding-inner6
          local.get $3
          i32.load offset=24
          local.tee $3
          i32.eqz
          br_if $folding-inner1
          local.get $0
          local.get $3
          i32.load offset=4
          local.get $1
          local.get $2
          call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#_transfer
          br $folding-inner5
         end
         local.get $1
         i32.const 1265010151
         i32.eq
         if
          local.get $0
          local.get $2
          call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readAddress
          local.get $2
          call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readAddress
          local.get $2
          call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readU256
          call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#_transfer
          br $folding-inner5
         end
         local.get $1
         i32.const -160920984
         i32.eq
         if
          local.get $2
          call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readAddress
          local.set $1
          local.get $2
          call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readU256
          local.set $3
          local.get $2
          call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readBytesWithLength
          local.set $2
          global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
          local.tee $4
          i32.load offset=24
          i32.eqz
          br_if $folding-inner6
          local.get $4
          i32.load offset=24
          local.tee $4
          i32.eqz
          br_if $folding-inner1
          local.get $0
          local.get $4
          i32.load offset=4
          local.get $1
          local.get $3
          local.get $2
          call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#_safeTransfer
          br $folding-inner5
         end
         local.get $1
         i32.const 1769024148
         i32.eq
         if
          local.get $0
          local.get $2
          call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readAddress
          local.get $2
          call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readAddress
          local.get $2
          call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readU256
          local.get $2
          call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readBytesWithLength
          call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#_safeTransfer
          br $folding-inner5
         end
         local.get $1
         i32.const -1626621783
         i32.eq
         if
          local.get $0
          local.get $2
          call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readAddress
          local.get $2
          call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readU256
          call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#_approve
          br $folding-inner5
         end
         local.get $1
         i32.const -305824359
         i32.eq
         if
          local.get $0
          local.get $2
          call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readU256
          local.tee $1
          call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#_exists
          i32.eqz
          if
           i32.const 16656
           i32.const 14368
           i32.const 368
           i32.const 37
           call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
           unreachable
          end
          local.get $0
          i32.load offset=68
          local.get $1
          call $~lib/@btc-vision/btc-runtime/runtime/storage/maps/StoredMapU256/StoredMapU256#get
          call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#_addressFromU256
          local.set $0
          br $folding-inner3
         end
         local.get $1
         i32.const -645942080
         i32.eq
         if
          local.get $2
          call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readAddress
          local.set $1
          local.get $2
          call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readBoolean
          local.set $2
          global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
          local.tee $3
          i32.load offset=24
          i32.eqz
          br_if $folding-inner6
          local.get $3
          i32.load offset=24
          local.tee $3
          i32.eqz
          br_if $folding-inner7
          local.get $1
          local.get $3
          i32.load offset=4
          call $~lib/@btc-vision/btc-runtime/runtime/types/Address/Address#equals
          if
           i32.const 18544
           i32.const 14368
           i32.const 385
           i32.const 48
           call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
           unreachable
          end
          global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
          local.tee $3
          i32.load offset=24
          i32.eqz
          br_if $folding-inner6
          local.get $3
          i32.load offset=24
          local.tee $3
          i32.eqz
          br_if $folding-inner7
          local.get $0
          local.get $3
          i32.load offset=4
          local.get $1
          local.get $2
          call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#_setApprovalForAll
          i32.const 0
          call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#constructor
          return
         end
         local.get $1
         i32.const 1742348210
         i32.eq
         if
          local.get $0
          local.get $2
          call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readAddress
          local.get $2
          call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readAddress
          call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#_isApprovedForAll
          local.set $0
          i32.const 1
          call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#constructor
          local.tee $1
          local.get $0
          call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeBoolean
          br $folding-inner4
         end
         local.get $1
         i32.const 1167857804
         i32.eq
         if
          local.get $0
          local.get $2
          call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#approveBySignature
          return
         end
         local.get $1
         i32.const 2096227139
         i32.eq
         if
          local.get $0
          local.get $2
          call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#setApprovalForAllBySignature
          return
         end
         local.get $1
         i32.const 814599775
         i32.eq
         if
          local.get $0
          local.get $2
          call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readU256
          call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#_burn
          br $folding-inner5
         end
         local.get $1
         i32.const -239107872
         i32.eq
         if
          i32.const 32
          call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#constructor
          local.tee $1
          local.get $0
          call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#_buildDomainSeparator
          call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeBytes
          br $folding-inner4
         end
         local.get $1
         i32.const 1218394464
         i32.eq
         if
          local.get $0
          local.get $2
          call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#tokenOfOwnerByIndex
          return
         end
         local.get $1
         i32.const -159233179
         i32.eq
         if
          local.get $2
          call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readAddress
          local.set $1
          local.get $0
          i32.load offset=80
          local.get $1
          call $~lib/@btc-vision/btc-runtime/runtime/memory/AddressMemoryMap/AddressMemoryMap#get
          local.set $0
          br $folding-inner2
         end
         local.get $1
         i32.const -706301647
         i32.eq
         if
          global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
          local.tee $1
          i32.load offset=24
          i32.eqz
          br_if $folding-inner6
          local.get $1
          i32.load offset=24
          local.tee $1
          i32.eqz
          br_if $folding-inner7
          local.get $1
          i32.load offset=4
          call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP_NET/OP_NET#onlyDeployer
          local.get $2
          call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readStringWithLength
          local.tee $1
          call $~lib/string/String#get:length
          i32.eqz
          if
           i32.const 20768
           i32.const 14368
           i32.const 520
           i32.const 34
           call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
           unreachable
          end
          local.get $1
          call $~lib/string/String#get:length
          i32.const 200
          i32.gt_u
          if
           i32.const 20848
           i32.const 14368
           i32.const 522
           i32.const 13
           call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
           unreachable
          end
          local.get $0
          i32.load offset=24
          local.get $1
          call $~lib/@btc-vision/btc-runtime/runtime/storage/BaseStoredString/BaseStoredString#set:value
          i32.const 0
          call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#constructor
          return
         end
         local.get $1
         i32.const -66252452
         i32.eq
         if
          local.get $0
          call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#metadata
          return
         end
         local.get $0
         local.get $1
         local.get $2
         call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP_NET/OP_NET#execute
         return
        end
        br $folding-inner7
       end
       i32.const 32
       call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#constructor
       local.tee $1
       local.get $0
       call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeU256
       br $folding-inner4
      end
      i32.const 32
      call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#constructor
      local.tee $1
      local.get $0
      call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeAddress
     end
     local.get $1
     return
    end
    i32.const 0
    call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#constructor
    return
   end
   i32.const 12704
   i32.const 5168
   i32.const 145
   i32.const 13
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  i32.const 9424
  i32.const 5168
  i32.const 147
  i32.const 16
  call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
  unreachable
 )
 (func $op721/DopamilioNFT/DopamilioNFT#execute (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  local.get $1
  i32.const -1345001860
  i32.eq
  if
   local.get $0
   local.get $2
   call $op721/DopamilioNFT/DopamilioNFT#tokenURI
   return
  end
  local.get $1
  i32.const -155015644
  i32.eq
  if
   local.get $0
   local.get $2
   call $op721/DopamilioNFT/DopamilioNFT#mint
   return
  end
  block $folding-inner4
   block $folding-inner3
    block $folding-inner2
     block $folding-inner0
      local.get $1
      i32.const -1591053970
      i32.eq
      if
       global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
       local.tee $1
       i32.load offset=24
       i32.eqz
       br_if $folding-inner0
       local.get $1
       i32.load offset=24
       local.tee $1
       i32.eqz
       br_if $folding-inner2
       local.get $1
       i32.load offset=4
       call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP_NET/OP_NET#onlyDeployer
       local.get $0
       call $op721/DopamilioNFT/DopamilioNFT#get:_currentPhase
       call $~lib/@btc-vision/btc-runtime/runtime/storage/StoredU256/StoredU256#get:value
       i64.load
       i64.const 0
       i64.ne
       if
        i32.const 15568
        i32.const 12080
        i32.const 295
        i32.const 53
        call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
        unreachable
       end
       local.get $0
       call $op721/DopamilioNFT/DopamilioNFT#get:_currentPhase
       i64.const 1
       i64.const 0
       i64.const 0
       i64.const 0
       call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#constructor
       call $~lib/@btc-vision/btc-runtime/runtime/storage/StoredU256/StoredU256#set:value
       i32.const 1
       call $op721/DopamilioNFT/PhaseActivatedEvent#constructor
       call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#emit
       br $folding-inner4
      end
      local.get $1
      i32.const -1165032095
      i32.eq
      if
       local.get $0
       call $op721/DopamilioNFT/DopamilioNFT#activateWL
       return
      end
      local.get $1
      i32.const -1573790566
      i32.eq
      if
       global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
       local.tee $1
       i32.load offset=24
       i32.eqz
       br_if $folding-inner0
       local.get $1
       i32.load offset=24
       local.tee $1
       i32.eqz
       br_if $folding-inner2
       local.get $1
       i32.load offset=4
       call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP_NET/OP_NET#onlyDeployer
       local.get $0
       call $op721/DopamilioNFT/DopamilioNFT#get:_currentPhase
       call $~lib/@btc-vision/btc-runtime/runtime/storage/StoredU256/StoredU256#get:value
       i64.load
       i64.const 2
       i64.ne
       if
        i32.const 15888
        i32.const 12080
        i32.const 324
        i32.const 53
        call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
        unreachable
       end
       local.get $0
       call $op721/DopamilioNFT/DopamilioNFT#get:_currentPhase
       i64.const 3
       i64.const 0
       i64.const 0
       i64.const 0
       call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#constructor
       call $~lib/@btc-vision/btc-runtime/runtime/storage/StoredU256/StoredU256#set:value
       i32.const 3
       call $op721/DopamilioNFT/PhaseActivatedEvent#constructor
       call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#emit
       br $folding-inner4
      end
      local.get $1
      i32.const 307654020
      i32.eq
      if
       global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
       local.tee $1
       i32.load offset=24
       i32.eqz
       br_if $folding-inner0
       local.get $1
       i32.load offset=24
       local.tee $1
       i32.eqz
       br_if $folding-inner2
       local.get $1
       i32.load offset=4
       call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP_NET/OP_NET#onlyDeployer
       local.get $2
       call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readU256
       local.tee $1
       i64.load offset=24
       local.get $1
       i64.load offset=16
       local.get $1
       i64.load
       local.get $1
       i64.load offset=8
       i64.or
       i64.or
       i64.or
       i64.eqz
       if
        i32.const 15984
        i32.const 12080
        i32.const 339
        i32.const 28
        call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
        unreachable
       end
       local.get $0
       call $op721/DopamilioNFT/DopamilioNFT#get:_wlRoot
       local.get $1
       call $~lib/@btc-vision/btc-runtime/runtime/storage/StoredU256/StoredU256#set:value
       i32.const 12
       i32.const 65
       call $~lib/rt/stub/__new
       i32.const 32
       call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#constructor
       local.tee $2
       local.get $1
       call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeU256
       i32.const 16080
       local.get $2
       call $~lib/@btc-vision/btc-runtime/runtime/events/NetEvent/NetEvent#constructor
       call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#emit
       br $folding-inner4
      end
      local.get $1
      i32.const 1018384905
      i32.eq
      if
       global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
       local.tee $1
       i32.load offset=24
       i32.eqz
       br_if $folding-inner0
       local.get $1
       i32.load offset=24
       local.tee $1
       i32.eqz
       br_if $folding-inner2
       local.get $1
       i32.load offset=4
       call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP_NET/OP_NET#onlyDeployer
       local.get $2
       call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readU256
       local.tee $1
       i64.load offset=24
       local.get $1
       i64.load offset=16
       local.get $1
       i64.load
       local.get $1
       i64.load offset=8
       i64.or
       i64.or
       i64.or
       i64.eqz
       if
        i32.const 16128
        i32.const 12080
        i32.const 354
        i32.const 29
        call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
        unreachable
       end
       local.get $0
       call $op721/DopamilioNFT/DopamilioNFT#get:_mintPrice
       local.get $1
       call $~lib/@btc-vision/btc-runtime/runtime/storage/StoredU256/StoredU256#set:value
       br $folding-inner4
      end
      local.get $1
      i32.const 481277811
      i32.eq
      if
       global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
       local.tee $1
       i32.load offset=24
       i32.eqz
       br_if $folding-inner0
       local.get $1
       i32.load offset=24
       local.tee $1
       i32.eqz
       br_if $folding-inner2
       local.get $1
       i32.load offset=4
       call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP_NET/OP_NET#onlyDeployer
       local.get $2
       call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readStringWithLength
       local.tee $1
       call $~lib/string/String#get:length
       i32.eqz
       if
        i32.const 16224
        i32.const 12080
        i32.const 368
        i32.const 32
        call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
        unreachable
       end
       local.get $0
       call $op721/DopamilioNFT/DopamilioNFT#get:_treasury
       local.get $1
       call $~lib/@btc-vision/btc-runtime/runtime/storage/BaseStoredString/BaseStoredString#set:value
       i32.const 12
       i32.const 66
       call $~lib/rt/stub/__new
       local.get $1
       call $~lib/string/String#get:length
       i32.const 4
       i32.add
       call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#constructor
       local.tee $2
       local.get $1
       call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeStringWithLength
       i32.const 16592
       local.get $2
       call $~lib/@btc-vision/btc-runtime/runtime/events/NetEvent/NetEvent#constructor
       call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#emit
       br $folding-inner4
      end
      local.get $1
      i32.const 273868816
      i32.eq
      if
       local.get $0
       call $op721/DopamilioNFT/DopamilioNFT#get:_mintPrice
       call $~lib/@btc-vision/btc-runtime/runtime/storage/StoredU256/StoredU256#get:value
       local.tee $1
       i64.load offset=24
       local.get $1
       i64.load offset=16
       local.get $1
       i64.load
       local.get $1
       i64.load offset=8
       i64.or
       i64.or
       i64.or
       i64.eqz
       if (result i32)
        i64.const 6969
        i64.const 0
        i64.const 0
        i64.const 0
        call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#constructor
       else
        local.get $0
        call $op721/DopamilioNFT/DopamilioNFT#get:_mintPrice
        call $~lib/@btc-vision/btc-runtime/runtime/storage/StoredU256/StoredU256#get:value
       end
       local.set $0
       br $folding-inner3
      end
      local.get $1
      i32.const -2046427922
      i32.eq
      if
       i32.const 1
       call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#constructor
       local.tee $1
       local.get $0
       call $op721/DopamilioNFT/DopamilioNFT#_getPhase
       call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeU8
       local.get $1
       return
      end
      local.get $1
      i32.const 219719804
      i32.eq
      if
       i32.const 1
       call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#constructor
       local.tee $0
       i32.const 0
       call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeBoolean
       local.get $0
       return
      end
      local.get $1
      i32.const -1566552507
      i32.eq
      if
       local.get $0
       call $op721/DopamilioNFT/DopamilioNFT#get:_treasury
       call $~lib/@btc-vision/btc-runtime/runtime/storage/BaseStoredString/BaseStoredString#get:value
       local.tee $0
       call $~lib/string/String#get:length
       i32.const 4
       i32.add
       call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#constructor
       local.tee $1
       local.get $0
       call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeStringWithLength
       local.get $1
       return
      end
      local.get $1
      i32.const -1842310192
      i32.eq
      if
       i32.const 32
       call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#constructor
       local.tee $1
       local.get $0
       call $op721/DopamilioNFT/DopamilioNFT#get:_wlRoot
       call $~lib/@btc-vision/btc-runtime/runtime/storage/StoredU256/StoredU256#get:value
       call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeU256
       local.get $1
       return
      end
      local.get $1
      i32.const -709759085
      i32.eq
      if
       i32.const 32
       call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#constructor
       local.tee $1
       local.get $0
       call $op721/DopamilioNFT/DopamilioNFT#get:_teamMintedTotal
       call $~lib/@btc-vision/btc-runtime/runtime/storage/StoredU256/StoredU256#get:value
       call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeU256
       local.get $1
       return
      end
      local.get $1
      i32.const -944781132
      i32.eq
      if
       local.get $2
       call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readAddress
       local.set $3
       local.get $2
       call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesReader/BytesReader#readU8
       local.set $2
       i64.const 0
       i64.const 0
       i64.const 0
       i64.const 0
       call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#constructor
       local.set $1
       local.get $2
       i32.const 2
       i32.eq
       if (result i32)
        local.get $0
        i32.load offset=120
        local.get $3
        call $~lib/@btc-vision/btc-runtime/runtime/memory/AddressMemoryMap/AddressMemoryMap#get
       else
        local.get $2
        i32.const 3
        i32.eq
        if (result i32)
         local.get $0
         i32.load offset=124
         local.get $3
         call $~lib/@btc-vision/btc-runtime/runtime/memory/AddressMemoryMap/AddressMemoryMap#get
        else
         local.get $1
        end
       end
       local.set $0
       br $folding-inner3
      end
      local.get $0
      local.get $1
      local.get $2
      call $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#execute
      return
     end
     i32.const 12704
     i32.const 5168
     i32.const 145
     i32.const 13
     call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
     unreachable
    end
    i32.const 9424
    i32.const 5168
    i32.const 147
    i32.const 16
    call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
    unreachable
   end
   i32.const 32
   call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#constructor
   local.tee $1
   local.get $0
   call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeU256
   local.get $1
   return
  end
  i32.const 1
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#constructor
  local.tee $0
  i32.const 1
  call $~lib/@btc-vision/btc-runtime/runtime/buffer/BytesWriter/BytesWriter#writeBoolean
  local.get $0
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/contracts/OP721/OP721#instantiate (param $0 i32) (param $1 i32)
  (local $2 i32)
  local.get $0
  i32.load offset=56
  call $~lib/@btc-vision/btc-runtime/runtime/storage/StoredU256/StoredU256#get:value
  local.tee $2
  i64.load offset=24
  local.get $2
  i64.load offset=16
  local.get $2
  i64.load
  local.get $2
  i64.load offset=8
  i64.or
  i64.or
  i64.or
  i64.eqz
  i32.eqz
  if
   i32.const 21136
   i32.const 14368
   i32.const 161
   i32.const 48
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $1
  i32.load
  call $~lib/string/String#get:length
  i32.eqz
  if
   i32.const 21200
   i32.const 14368
   i32.const 164
   i32.const 38
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $1
  i32.load offset=4
  call $~lib/string/String#get:length
  i32.eqz
  if
   i32.const 21264
   i32.const 14368
   i32.const 165
   i32.const 40
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $1
  i32.load offset=12
  local.tee $2
  i64.load offset=24
  local.get $2
  i64.load offset=16
  local.get $2
  i64.load
  local.get $2
  i64.load offset=8
  i64.or
  i64.or
  i64.or
  i64.eqz
  if
   i32.const 21328
   i32.const 14368
   i32.const 166
   i32.const 40
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  local.get $0
  i32.load offset=16
  local.get $1
  i32.load
  call $~lib/@btc-vision/btc-runtime/runtime/storage/BaseStoredString/BaseStoredString#set:value
  local.get $0
  i32.load offset=20
  local.get $1
  i32.load offset=4
  call $~lib/@btc-vision/btc-runtime/runtime/storage/BaseStoredString/BaseStoredString#set:value
  local.get $0
  i32.load offset=24
  local.get $1
  i32.load offset=8
  call $~lib/@btc-vision/btc-runtime/runtime/storage/BaseStoredString/BaseStoredString#set:value
  local.get $0
  i32.load offset=48
  local.get $1
  i32.load offset=12
  call $~lib/@btc-vision/btc-runtime/runtime/storage/StoredU256/StoredU256#set:value
  local.get $0
  i32.load offset=52
  i64.const 1
  i64.const 0
  i64.const 0
  i64.const 0
  call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#constructor
  call $~lib/@btc-vision/btc-runtime/runtime/storage/StoredU256/StoredU256#set:value
  local.get $0
  i32.load offset=56
  i64.const 1
  i64.const 0
  i64.const 0
  i64.const 0
  call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#constructor
  call $~lib/@btc-vision/btc-runtime/runtime/storage/StoredU256/StoredU256#set:value
  local.get $0
  i32.load offset=60
  i64.const 0
  i64.const 0
  i64.const 0
  i64.const 0
  call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#constructor
  call $~lib/@btc-vision/btc-runtime/runtime/storage/StoredU256/StoredU256#set:value
  local.get $0
  i32.load offset=28
  local.get $1
  i32.load offset=16
  call $~lib/@btc-vision/btc-runtime/runtime/storage/BaseStoredString/BaseStoredString#set:value
  local.get $0
  i32.load offset=32
  local.get $1
  i32.load offset=20
  call $~lib/@btc-vision/btc-runtime/runtime/storage/BaseStoredString/BaseStoredString#set:value
  local.get $0
  i32.load offset=36
  local.get $1
  i32.load offset=28
  call $~lib/@btc-vision/btc-runtime/runtime/storage/BaseStoredString/BaseStoredString#set:value
  local.get $0
  i32.load offset=40
  local.get $1
  i32.load offset=24
  call $~lib/@btc-vision/btc-runtime/runtime/storage/BaseStoredString/BaseStoredString#set:value
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/storage/arrays/StoredU256Array/StoredU256Array#calculateStoragePointer (param $0 i32) (param $1 i64) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  local.get $0
  i32.load
  local.tee $4
  i32.load offset=8
  i32.const 32
  i32.ne
  if
   i32.const 12144
   i32.const 10128
   i32.const 163
   i32.const 9
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  i32.const 0
  i32.const 32
  call $~lib/typedarray/Uint8Array#constructor
  local.set $5
  loop $for-loop|0
   local.get $2
   i32.const 8
   i32.lt_s
   if
    local.get $5
    i32.const 31
    local.get $2
    i32.sub
    local.get $1
    i64.const 255
    i64.and
    i32.wrap_i64
    call $~lib/typedarray/Uint8Array#__set
    local.get $1
    i64.const 8
    i64.shr_u
    local.set $1
    local.get $2
    i32.const 1
    i32.add
    local.set $2
    br $for-loop|0
   end
  end
  local.get $4
  i32.load offset=8
  i32.const 32
  i32.ne
  if (result i32)
   i32.const 1
  else
   local.get $5
   i32.load offset=8
   i32.const 32
   i32.ne
  end
  if
   i32.const 12240
   i32.const 10128
   i32.const 48
   i32.const 9
   call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
   unreachable
  end
  i32.const 0
  i32.const 32
  call $~lib/typedarray/Uint8Array#constructor
  local.set $0
  i32.const 31
  local.set $2
  loop $for-loop|1
   local.get $2
   i32.const 0
   i32.ge_s
   if
    local.get $0
    local.get $2
    local.get $4
    local.get $2
    call $~lib/typedarray/Uint8Array#__get
    local.get $5
    local.get $2
    call $~lib/typedarray/Uint8Array#__get
    i32.add
    local.get $3
    i32.add
    local.tee $3
    i32.const 255
    i32.and
    call $~lib/typedarray/Uint8Array#__set
    local.get $3
    i32.const 8
    i32.shr_u
    local.set $3
    local.get $2
    i32.const 1
    i32.sub
    local.set $2
    br $for-loop|1
   end
  end
  local.get $0
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/contracts/ReentrancyGuard/ReentrancyGuard#isSelectorExcluded@override (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  i32.const 8
  i32.sub
  i32.load
  drop
  local.get $1
  i32.const 1397356254
  i32.eq
  local.get $1
  i32.const -666993220
  i32.eq
  i32.or
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/storage/BaseStoredString/BaseStoredString#getClassName@override (param $0 i32)
  local.get $0
  i32.const 8
  i32.sub
  i32.load
  i32.const 41
  i32.eq
  if
   return
  end
  unreachable
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/storage/arrays/StoredPackedArray/StoredPackedArray<~lib/@btc-vision/as-bignum/assembly/integer/u256/u256>#getSlotCapacity@override (param $0 i32)
  local.get $0
  i32.const 8
  i32.sub
  i32.load
  i32.const 52
  i32.eq
  if
   return
  end
  unreachable
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/storage/arrays/StoredPackedArray/StoredPackedArray<~lib/@btc-vision/as-bignum/assembly/integer/u256/u256>#calculateStoragePointer@override (param $0 i32) (param $1 i64) (result i32)
  local.get $0
  i32.const 8
  i32.sub
  i32.load
  i32.const 52
  i32.eq
  if
   local.get $0
   local.get $1
   call $~lib/@btc-vision/btc-runtime/runtime/storage/arrays/StoredU256Array/StoredU256Array#calculateStoragePointer
   return
  end
  unreachable
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/storage/arrays/StoredPackedArray/StoredPackedArray<~lib/@btc-vision/as-bignum/assembly/integer/u256/u256>#unpackSlot@override (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  i32.const 8
  i32.sub
  i32.load
  i32.const 52
  i32.eq
  if
   local.get $1
   i32.load offset=8
   i32.const 32
   i32.ne
   if
    i32.const 2304
    i32.const 5664
    i32.const 220
    i32.const 30
    call $~lib/@btc-vision/btc-runtime/runtime/abort/abort/revertOnError
    unreachable
   end
   local.get $1
   i32.load offset=4
   local.tee $0
   i64.load offset=24
   call $~lib/polyfills/bswap<u64>
   local.get $0
   i64.load offset=16
   call $~lib/polyfills/bswap<u64>
   local.get $0
   i64.load offset=8
   call $~lib/polyfills/bswap<u64>
   local.get $0
   i64.load
   call $~lib/polyfills/bswap<u64>
   call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#constructor
   local.set $0
   i32.const 1
   i32.const 2
   i32.const 61
   i32.const 0
   call $~lib/rt/__newArray
   local.tee $1
   i32.const 0
   local.get $0
   call $~lib/array/Array<~lib/typedarray/Uint8Array>#__set
   local.get $1
   return
  end
  unreachable
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/storage/arrays/StoredPackedArray/StoredPackedArray<~lib/@btc-vision/as-bignum/assembly/integer/u256/u256>#eq@override (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  local.get $0
  i32.const 8
  i32.sub
  i32.load
  i32.const 52
  i32.eq
  if
   local.get $1
   i64.load
   local.get $2
   i64.load
   i64.eq
   if (result i32)
    local.get $1
    i64.load offset=8
    local.get $2
    i64.load offset=8
    i64.eq
   else
    i32.const 0
   end
   if (result i32)
    local.get $1
    i64.load offset=16
    local.get $2
    i64.load offset=16
    i64.eq
   else
    i32.const 0
   end
   if (result i32)
    local.get $1
    i64.load offset=24
    local.get $2
    i64.load offset=24
    i64.eq
   else
    i32.const 0
   end
   return
  end
  unreachable
 )
 (func $~lib/@btc-vision/btc-runtime/runtime/storage/arrays/StoredPackedArray/StoredPackedArray<~lib/@btc-vision/as-bignum/assembly/integer/u256/u256>#packSlot@override (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $0
  i32.const 8
  i32.sub
  i32.load
  i32.const 52
  i32.eq
  if
   local.get $1
   i32.const 0
   call $~lib/array/Array<~lib/@btc-vision/btc-runtime/runtime/plugins/Plugin/Plugin>#__get
   local.set $1
   i32.const 0
   i32.const 32
   call $~lib/typedarray/Uint8Array#constructor
   local.tee $2
   i32.load offset=4
   local.tee $0
   local.get $1
   i64.load offset=24
   call $~lib/polyfills/bswap<u64>
   i64.store
   local.get $0
   local.get $1
   i64.load offset=16
   call $~lib/polyfills/bswap<u64>
   i64.store offset=8
   local.get $0
   local.get $1
   i64.load offset=8
   call $~lib/polyfills/bswap<u64>
   i64.store offset=16
   local.get $0
   local.get $1
   i64.load
   call $~lib/polyfills/bswap<u64>
   i64.store offset=24
   local.get $2
   return
  end
  unreachable
 )
 (func $"~lib/@btc-vision/btc-runtime/runtime/generic/Map/Map<~lib/@btc-vision/btc-runtime/runtime/types/Address/Address,~lib/@btc-vision/btc-runtime/runtime/memory/Nested/Nested<~lib/@btc-vision/as-bignum/assembly/integer/u256/u256>>#indexOf@override" (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $0
  i32.const 8
  i32.sub
  i32.load
  drop
  block $"__inlined_func$~lib/@btc-vision/btc-runtime/runtime/generic/Map/Map<~lib/@btc-vision/btc-runtime/runtime/types/Address/Address,~lib/@btc-vision/btc-runtime/runtime/memory/Nested/Nested<~lib/@btc-vision/as-bignum/assembly/integer/u256/u256>>#indexOf$359" (result i32)
   local.get $0
   i32.load
   i32.load offset=12
   local.set $2
   local.get $0
   i32.load offset=8
   i32.const -1
   i32.ne
   if (result i32)
    local.get $0
    i32.load offset=8
    local.get $2
    i32.lt_s
   else
    i32.const 0
   end
   if
    local.get $0
    i32.load
    local.get $0
    i32.load offset=8
    call $~lib/array/Array<~lib/typedarray/Uint8Array>#__uget
    local.get $1
    call $~lib/@btc-vision/btc-runtime/runtime/types/Address/Address#equals
    if
     local.get $0
     i32.load offset=8
     br $"__inlined_func$~lib/@btc-vision/btc-runtime/runtime/generic/Map/Map<~lib/@btc-vision/btc-runtime/runtime/types/Address/Address,~lib/@btc-vision/btc-runtime/runtime/memory/Nested/Nested<~lib/@btc-vision/as-bignum/assembly/integer/u256/u256>>#indexOf$359"
    end
   end
   local.get $2
   i32.const 1
   i32.sub
   local.set $2
   loop $for-loop|0
    local.get $2
    i32.const 0
    i32.ge_s
    if
     local.get $0
     i32.load
     local.get $2
     call $~lib/array/Array<~lib/typedarray/Uint8Array>#__uget
     local.get $1
     call $~lib/@btc-vision/btc-runtime/runtime/types/Address/Address#equals
     if
      local.get $0
      local.get $2
      i32.store offset=8
      local.get $2
      br $"__inlined_func$~lib/@btc-vision/btc-runtime/runtime/generic/Map/Map<~lib/@btc-vision/btc-runtime/runtime/types/Address/Address,~lib/@btc-vision/btc-runtime/runtime/memory/Nested/Nested<~lib/@btc-vision/as-bignum/assembly/integer/u256/u256>>#indexOf$359"
     end
     local.get $2
     i32.const 1
     i32.sub
     local.set $2
     br $for-loop|0
    end
   end
   i32.const -1
  end
 )
 (func $~start
  (local $0 i32)
  global.get $~started
  if
   return
  end
  i32.const 1
  global.set $~started
  call $start:~lib/@btc-vision/btc-runtime/runtime/index
  i64.const 3333
  i64.const 0
  i64.const 0
  i64.const 0
  call $~lib/@btc-vision/as-bignum/assembly/integer/u256/u256#constructor
  global.set $op721/DopamilioNFT/MAX_SUPPLY
  global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
  call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#get:nextPointer
  i32.const 65535
  i32.and
  global.set $op721/DopamilioNFT/mintPricePointer
  global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
  call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#get:nextPointer
  i32.const 65535
  i32.and
  global.set $op721/DopamilioNFT/currentPhasePointer
  global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
  call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#get:nextPointer
  i32.const 65535
  i32.and
  global.set $op721/DopamilioNFT/treasuryPointer
  global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
  call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#get:nextPointer
  i32.const 65535
  i32.and
  global.set $op721/DopamilioNFT/wlMerkleRootPointer
  global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
  call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#get:nextPointer
  i32.const 65535
  i32.and
  global.set $op721/DopamilioNFT/mintedWlPointer
  global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
  call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#get:nextPointer
  i32.const 65535
  i32.and
  global.set $op721/DopamilioNFT/mintedPubPointer
  global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
  call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#get:nextPointer
  i32.const 65535
  i32.and
  global.set $op721/DopamilioNFT/teamMintedTotalPointer
  global.get $~lib/@btc-vision/btc-runtime/runtime/env/index/Blockchain
  local.tee $0
  i32.const 8656
  i32.store offset=28
  local.get $0
  call $~lib/@btc-vision/btc-runtime/runtime/env/BlockchainEnvironment/BlockchainEnvironment#createContractIfNotExists
 )
)
