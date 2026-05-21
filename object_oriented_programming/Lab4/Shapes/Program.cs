namespace Shapes
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Shape rectangle = new Rectangle(5, 10);
            rectangle.Info();

            Shape square = new Square(10);
            square.Info();

            Shape circle = new Circle(10);
            circle.Info();

            Shape triangle = new Triangle(3, 4, 5);
            triangle.Info();
        }
    }
}
