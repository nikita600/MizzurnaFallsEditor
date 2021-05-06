using System;
using System.Collections.Generic;
using System.IO;

namespace MizzurnaFallsEditor.Utilities
{
    public sealed partial class HuffmanUtility
    {
        #region Public

        public static byte[] Compress(List<List<short>> strings)
        {
            Build(strings, out var rootNode, out var characterTable);

            var treeSize = characterTable.Count;
            var leftNodes = new ushort[treeSize - 1];
            var rightNodes = new ushort[treeSize - 1];
            var characters = new short[treeSize];
            SerializeCharacterTable(rootNode, leftNodes, rightNodes, characters);
            
            var pointers = new List<ushort>();
            var bitIndexes = new List<byte>();
            var stringData = new List<byte>();
            SerializeStrings(characterTable, strings, pointers,  bitIndexes, stringData);
            
            return Serialize(strings.Count, new List<ushort>(leftNodes), new List<ushort>(rightNodes),
                new List<short>(characters), pointers, bitIndexes, stringData);
        }
        
        public static void Compress(List<List<short>> strings, out Dictionary<short, List<bool>> characterTable, 
            out ushort[] leftNodes, out ushort[] rightNodes, out short[] characters)
        {
            Build(strings, out var rootNode, out characterTable);
            
            var treeSize = characterTable.Count;
            leftNodes = new ushort[treeSize - 1];
            rightNodes = new ushort[treeSize - 1];
            characters = new short[treeSize];
            SerializeCharacterTable(rootNode, leftNodes, rightNodes, characters);
        }

        public static byte[] Compress(List<List<short>> strings, Dictionary<short, List<bool>> characterTable,
            ushort[] leftNodes, ushort[] rightNodes, short[] characters)
        {
            var pointers = new List<ushort>();
            var bitIndexes = new List<byte>();
            var stringData = new List<byte>();
            SerializeStrings(characterTable, strings, pointers,  bitIndexes, stringData);
            
            return Serialize(strings.Count, new List<ushort>(leftNodes), new List<ushort>(rightNodes),
                new List<short>(characters), pointers, bitIndexes, stringData);
        }

        #endregion

        #region Private

        private static void Build(List<List<short>> strings, out Node rootNode, out Dictionary<short, List<bool>> characterTable)
        {
            rootNode = CreateHuffmanTree(strings);
            characterTable = new Dictionary<short, List<bool>>();
            AddNodeData(rootNode, characterTable);
                
            void AddNodeData(Node node, IDictionary<short, List<bool>> charTable)
            {
                if (node.IsLeafNode)
                {
                    charTable.Add(node.Character, node.BinaryCode);
                }
                else
                {
                    AddNodeData(node.LeftNode, charTable);
                    AddNodeData(node.RightNode, charTable);
                }
            }
        }
        
        private static Node CreateHuffmanTree(List<List<short>> strings)
        {
            var table = new Dictionary<short, int>();
            foreach (var str in strings)
            {
                foreach (var chr in str)
                {
                    if (!table.ContainsKey(chr))
                    {
                        table.Add(chr, 0);
                    }

                    table[chr]++;
                }
            }

            var nodes = new List<Node>();
            foreach (var entry in table)
            {
                nodes.Add(new Node(entry.Key, entry.Value));
            }
            
            while (nodes.Count > 1)
            {
                nodes.Sort((lhs, rhs) => lhs.Frequency.CompareTo(rhs.Frequency));

                var left = nodes[0];
                left.IsLeftNode = true;
                nodes.RemoveAt(0);
                
                var right = nodes[0];
                nodes.RemoveAt(0);
                
                nodes.Add(new Node(left, right));
            }

            var rootNode = nodes[0];
            rootNode.SetCode(new List<bool>());

            return rootNode;
        }

        private static void SerializeCharacterTable(Node rootNode, ushort[] leftNodes, ushort[] rightNodes, short[] characters)
        {
            var nodeIndex = 0;
            var charIndex = 0;
            var isRootNode = true;
            
            var nodeQueue = new List<KeyValuePair<Node, int>> { new KeyValuePair<Node, int>(rootNode, 0) };
            while (nodeQueue.Count > 0)
            {
                var entry = nodeQueue[0];
                nodeQueue.RemoveAt(0);
                
                var node = entry.Key;
                var parentNode = entry.Value;
                var nodesTree = node.IsLeftNode ? leftNodes : rightNodes;
                if (node.IsLeafNode)
                {
                    characters[charIndex] = node.Character;
                    nodesTree[parentNode] = (ushort)(charIndex | 0x8000);
                    
                    charIndex++;
                }
                else
                {
                    if (isRootNode)
                    {
                        isRootNode = false;
                    }
                    else
                    {
                        nodesTree[parentNode] = (ushort)nodeIndex;
                    }
                    
                    nodeQueue.Add(new KeyValuePair<Node, int>(node.LeftNode, nodeIndex));
                    nodeQueue.Add(new KeyValuePair<Node, int>(node.RightNode, nodeIndex));
                    
                    nodeIndex++;
                }
            }
        }
        
        private static void SerializeStrings(Dictionary<short, List<bool>> characterTable, List<List<short>> strings, List<ushort> pointers, List<byte> bitIndexes, List<byte> stringsData)
        {
            var bitIndex = default(byte);
            var stringByte = default(byte);
            foreach (var str in strings)
            {
                bitIndexes.Add(bitIndex);
                pointers.Add((ushort)stringsData.Count);
                pointers.Add((ushort)str.Count);
                
                foreach (var chr in str)
                {
                    if (characterTable.TryGetValue(chr, out var code))
                    {
                        foreach (var bit in code)
                        {
                            stringByte = (byte)((stringByte << 1) | (bit ? 1 : 0));

                            bitIndex++;
                            if (bitIndex < 8)
                            {
                                continue;
                            }
                            
                            stringsData.Add(stringByte);
                            bitIndex = 0;
                        }
                    }
                    else
                    {
                        throw new Exception("Fail");
                    }
                }
            }

            for (; bitIndex < 8; ++bitIndex)
            {
                stringByte = (byte)((stringByte << 1) | 0);
            }
            stringsData.Add(stringByte);
        }
        
        private static byte[] Serialize(int stringsCount, 
            List<ushort> leftNodes, List<ushort> rightNodes, List<short> characters,
            List<ushort> pointers, List<byte> bitIndexes, List<byte> stringsData)
        {
            using (var memoryStream = new MemoryStream())
            {
                using (var binaryWriter = new BinaryWriter(memoryStream))
                {
                    binaryWriter.Write(stringsCount);
                    
                    var stringPointersPosition = memoryStream.Position;
                    binaryWriter.Write(0);
                    var bitIndexesPosition = memoryStream.Position;
                    binaryWriter.Write(0);
                    var stringsPosition = memoryStream.Position;
                    binaryWriter.Write(0);

                    var leftNodesPosition = memoryStream.Position;
                    binaryWriter.Write(0);
                    binaryWriter.Write(leftNodes.Count);

                    var rightNodesPosition = memoryStream.Position;
                    binaryWriter.Write(0);
                    binaryWriter.Write(rightNodes.Count);

                    var charactersPosition = memoryStream.Position;
                    binaryWriter.Write(0);
                    binaryWriter.Write(characters.Count);

                    var leftNodesOffset = (int)memoryStream.Position;
                    foreach (var leftNode in leftNodes)
                    {
                        binaryWriter.Write(leftNode);
                    }

                    var rightNodesOffset = (int)memoryStream.Position;
                    foreach (var rightNode in rightNodes)
                    {
                        binaryWriter.Write(rightNode);
                    }

                    var characterOffset = (int)memoryStream.Position;
                    foreach (var character in characters)
                    {
                        binaryWriter.Write(character);
                    }

                    var pointerOffset = (int)memoryStream.Position;
                    foreach (var pointer in pointers)
                    {
                        binaryWriter.Write(pointer);
                    }

                    var bitIndexesOffset = (int)memoryStream.Position;
                    foreach (var bitIndex in bitIndexes)
                    {
                        binaryWriter.Write(bitIndex);
                    }

                    var stringsOffset = (int)memoryStream.Position;
                    foreach (var b in stringsData)
                    {
                        binaryWriter.Write(b);
                    }

                    memoryStream.Position = stringPointersPosition;
                    binaryWriter.Write(pointerOffset);

                    memoryStream.Position = bitIndexesPosition;
                    binaryWriter.Write(bitIndexesOffset);

                    memoryStream.Position = leftNodesPosition;
                    binaryWriter.Write(leftNodesOffset);

                    memoryStream.Position = rightNodesPosition;
                    binaryWriter.Write(rightNodesOffset);

                    memoryStream.Position = charactersPosition;
                    binaryWriter.Write(characterOffset);

                    memoryStream.Position = stringsPosition;
                    binaryWriter.Write(stringsOffset);
                }

                return memoryStream.ToArray();
            }
        }

        #endregion
    }
}