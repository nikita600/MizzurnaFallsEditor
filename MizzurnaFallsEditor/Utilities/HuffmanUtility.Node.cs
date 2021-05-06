using System.Collections.Generic;

namespace MizzurnaFallsEditor.Utilities
{
    public partial class HuffmanUtility
    {
        #region Nested

        public sealed class Node
        {
            public readonly int Frequency;
            public readonly short Character;
            
            public readonly Node LeftNode;
            public readonly Node RightNode;
            
            public List<bool> BinaryCode { get; private set; }

            public bool IsLeafNode => LeftNode == null && RightNode == null;
            
            public bool IsLeftNode { get; set; }
            
            public Node(Node leftNode, Node rightNode)
            {
                LeftNode = leftNode;
                Frequency += leftNode.Frequency;
                
                RightNode = rightNode;
                Frequency += rightNode.Frequency;
            }

            public Node(short character, int frequency)
            {
                Character = character;
                Frequency = frequency;
            }
            
            public void SetCode(List<bool> binaryCode)
            {
                if (IsLeafNode)
                {
                    BinaryCode = binaryCode;

                    //var codeString = binaryCode.Aggregate(string.Empty, (current, b) => current + (b ? "1" : "0"));
                    //Console.WriteLine("Character: " + Character.ToString("X4") + ", Freq: " + Frequency + ", BinCode: " + codeString);
                }
                else
                {
                    LeftNode.SetCode(new List<bool>(binaryCode) { false });
                    RightNode.SetCode(new List<bool>(binaryCode) { true }); 
                }
            }
        }
        
        #endregion
    }
}