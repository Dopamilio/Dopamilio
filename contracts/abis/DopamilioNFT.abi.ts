import { ABIDataTypes, BitcoinAbiTypes, OP_NET_ABI } from 'opnet';

export const DopamilioNFTEvents = [];

export const DopamilioNFTAbi = [
    {
        name: 'tokenURI',
        constant: true,
        inputs: [{ name: 'tokenId', type: ABIDataTypes.UINT256 }],
        outputs: [{ name: 'uri', type: ABIDataTypes.STRING }],
        type: BitcoinAbiTypes.Function,
    },
    {
        name: 'mint',
        inputs: [{ name: 'amount', type: ABIDataTypes.UINT64 }],
        outputs: [{ name: 'firstTokenId', type: ABIDataTypes.UINT256 }],
        type: BitcoinAbiTypes.Function,
    },
    {
        name: 'activateTeam',
        inputs: [],
        outputs: [{ name: 'success', type: ABIDataTypes.BOOL }],
        type: BitcoinAbiTypes.Function,
    },
    {
        name: 'activateWL',
        inputs: [],
        outputs: [{ name: 'success', type: ABIDataTypes.BOOL }],
        type: BitcoinAbiTypes.Function,
    },
    {
        name: 'activatePublic',
        inputs: [],
        outputs: [{ name: 'success', type: ABIDataTypes.BOOL }],
        type: BitcoinAbiTypes.Function,
    },
    {
        name: 'setMintPrice',
        inputs: [{ name: 'priceSats', type: ABIDataTypes.UINT256 }],
        outputs: [{ name: 'success', type: ABIDataTypes.BOOL }],
        type: BitcoinAbiTypes.Function,
    },
    {
        name: 'setTreasuryAddress',
        inputs: [{ name: 'addr', type: ABIDataTypes.STRING }],
        outputs: [{ name: 'success', type: ABIDataTypes.BOOL }],
        type: BitcoinAbiTypes.Function,
    },
    {
        name: 'getMintPrice',
        constant: true,
        inputs: [],
        outputs: [{ name: 'priceSats', type: ABIDataTypes.UINT256 }],
        type: BitcoinAbiTypes.Function,
    },
    {
        name: 'getPhase',
        constant: true,
        inputs: [],
        outputs: [{ name: 'phase', type: ABIDataTypes.UINT8 }],
        type: BitcoinAbiTypes.Function,
    },
    {
        name: 'getIsTestnet',
        constant: true,
        inputs: [],
        outputs: [{ name: 'isTestnet', type: ABIDataTypes.BOOL }],
        type: BitcoinAbiTypes.Function,
    },
    {
        name: 'getTreasuryAddress',
        constant: true,
        inputs: [],
        outputs: [{ name: 'addr', type: ABIDataTypes.STRING }],
        type: BitcoinAbiTypes.Function,
    },
    {
        name: 'getTeamMintedTotal',
        constant: true,
        inputs: [],
        outputs: [{ name: 'total', type: ABIDataTypes.UINT256 }],
        type: BitcoinAbiTypes.Function,
    },
    {
        name: 'getMintedCount',
        constant: true,
        inputs: [
            { name: 'addr', type: ABIDataTypes.ADDRESS },
            { name: 'phase', type: ABIDataTypes.UINT8 },
        ],
        outputs: [{ name: 'count', type: ABIDataTypes.UINT256 }],
        type: BitcoinAbiTypes.Function,
    },
    {
        name: 'getWlStartTime',
        constant: true,
        inputs: [],
        outputs: [{ name: 'startTime', type: ABIDataTypes.UINT64 }],
        type: BitcoinAbiTypes.Function,
    },
    {
        name: 'getWlDuration',
        constant: true,
        inputs: [],
        outputs: [{ name: 'durationSecs', type: ABIDataTypes.UINT64 }],
        type: BitcoinAbiTypes.Function,
    },
    ...DopamilioNFTEvents,
    ...OP_NET_ABI,
];

export default DopamilioNFTAbi;
