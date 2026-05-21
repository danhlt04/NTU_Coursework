namespace Stack
{
    internal class Program
    {
        static void Main(string[] args)
        {
            BasicStack stack = new HexaStack();
            stack.Push(123456);
            stack.Print();
        }
    }
}
