using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using FigurasGeometricas;

namespace Figura
{
    public class Program
    {
        public static void Main(string[] args)
        {
            List<FiguraGeometrica> lst = new List<FiguraGeometrica>();
            FiguraGeometrica fig; 
            string saida = "";

            do
            {

                Console.WriteLine("Digite qual figura deseja escolher:\n 1 - Retângulo \n 2 - Quadrado \n 3 - Elipse \n 4 - Círculo \n 5 - Para mostrar lados das figuras");
                string opcao = Console.ReadLine();

                switch (opcao)
                {
                    case "1":
                        Console.Write("Digite a altura: ");
                        double altura = Convert.ToDouble(Console.ReadLine());
                        Console.Write("Digite a largura: ");
                        double largura = Convert.ToDouble(Console.ReadLine());
                        fig = new Retangulo(altura, largura);
                        fig.CalcArea();
                        lst.Add(fig);
                        Console.WriteLine("A área do retângulo é: {0}", fig.Area);
                        break;
                        
                    case "2":
                        Console.WriteLine("Digite o lado");
                        double lado = Convert.ToDouble(Console.ReadLine());
                       fig = new Quadrado(lado);
                        fig.CalcArea();
                        lst.Add(fig);
                        Console.WriteLine("A área do quadrado é: {0}", fig.Area);
                        break;

                    case "3":
                        Console.Write("Digite o primeiro raio: ");
                        double raio1 = Convert.ToDouble(Console.ReadLine());
                        Console.Write("Digite o segundo raio: ");
                        double raio2 = Convert.ToDouble(Console.ReadLine());
                        fig= new Elipse(raio1, raio2);
                        fig.CalcArea();
                        lst.Add(fig);
                        Console.WriteLine("A área da elipse é: {0}", fig.Area);
                        break;

                    case "4":
                        Console.Write("Digite o raio: ");
                        double raioCirc = Convert.ToDouble(Console.ReadLine());
                        fig = new Circulo(raioCirc);
                        fig.CalcArea();
                        lst.Add(fig);
                        Console.WriteLine("A área do círculo é: {0}", fig.Area);
                        break;

                    case "5":
                        Console.WriteLine("Lados das figuras calculadas");
                        foreach (FiguraGeometrica fig3 in lst)
                        {                  
                                Console.WriteLine("Lados da figura: Figura -> {0} Quantidade de lados -> {1}",
                                fig3.GetType(), fig3.Lados());  
                        }
                        break;
                    default:
                        break;
                }
                Console.WriteLine("\nexit para sair");
                saida = Console.ReadLine();
            } while (saida != "exit");

            foreach (FiguraGeometrica fig2 in lst)
            {
                if (fig2.GetType() == typeof(Retangulo))
                {
                    Console.WriteLine(fig2.ToString());
                    Console.Write("Perímetro: {0} ", ((Retangulo)fig2).Perimetro());
                    //Console.WriteLine("Lados da figura: {0}", fig2.Lados());
                }
                else if (fig2.GetType() == typeof(Quadrado))
                {
                    Console.WriteLine(fig2.ToString());
                    //Console.WriteLine("Lados da figura: {0}", fig2.Lados());
                }
                else if (fig2.GetType() == typeof(Elipse))
                {
                    Console.WriteLine(fig2.ToString());
                    //Console.WriteLine("Lados da figura: {0}", fig2.Lados());
                }
                else if (fig2.GetType() == typeof(Circulo))
                {
                    Console.WriteLine(fig2.ToString());
                    //Console.WriteLine("Lados da figura: {0}", fig2.Lados());
                }
            }
            Console.ReadKey();
        }
    }
} // Herança pai pode ser filho, filho nao pode ser pai
