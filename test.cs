using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Exercicio3._2
{
    public abstract class FiguraGeometrica
    {
        protected Double area;
        public abstract void CalcArea();
        public Double Area
        {
            get { return area; }
        }
    }
    public class Retangulo : FiguraGeometrica
    {
        protected Double largura;
        protected Double altura;
        public Retangulo(Double largura, Double altura)
        {
            this.altura = altura;
            this.largura = largura;
        }
        public override void CalcArea()
        {
            area = largura * altura;
        }
        public Double Perimetro()
        {
            return 2 * largura + 2 * altura;
        }
        public override string ToString()
        {
            return "Retângulo";
        }
    }
    public class Quadrado : Retangulo
    {
        public Quadrado(Double lado)
            : base(lado, lado)
        {
        }
        public override string ToString()
        {
            return "Quadrado";
        }
    }
    public class Elipse : FiguraGeometrica
    {
        protected Double raio1;
        protected Double raio2;
        public Elipse(Double raio1, Double raio2)
        {
            this.raio2 = raio2;
            this.raio1 = raio1;
        }
        public override void CalcArea()
        {
            area = Math.PI * raio1 * raio2;
        }
        public override string ToString()
        {
            return "Elipse";
        }
    }
    public class Circulo : Elipse
    {
        public Circulo(Double raio)
            : base(raio, raio)
        {
        }
        public override string ToString()
        {
            return "Círculo";
        }
    }
    class Program
    {
        static void Main(string[] args)
        {
            Exercicio();
            Console.Write("\nTecle algo para encerrar...");
            Console.ReadKey();
        }
        private static T Ler<T>(String texto)
        {
            T retorno = default(T);
            Int32 x, y;
            Boolean sair = false;
            x = Console.CursorLeft;
            y = Console.CursorTop;
            do
            {
                Console.SetCursorPosition(x, y);
                Console.WriteLine(" ".PadLeft(80, ' '));
                Console.SetCursorPosition(x, y);
                Console.Write(texto);
                String teclado = Console.ReadLine();
                try
                {
                    retorno = (T)Convert.ChangeType(teclado, typeof(T));
                    Console.SetCursorPosition(x, y + 1);
                    Console.WriteLine(" ".PadLeft(80, ' '));
                    Console.SetCursorPosition(0, y + 1);
                    sair = true;
                }
                catch (Exception)
                {
                    Console.SetCursorPosition(x, y + 1);
                    Console.Write("Erro de conversão. Tente novamente...");
                    sair = false;
                }

            } while (!sair);
            return retorno;
        }
        static void Exercicio()
        {
            ArrayList figuras = new ArrayList();
            Double vl1, vl2;
            Boolean sair = false;
            FiguraGeometrica fig = null;
            do
            {
                Console.Clear();
                #region principal
                Console.WriteLine("3.2 - Entendendo a estrutura de classe do C#");

                Console.WriteLine("1 - Retângulo");
                Console.WriteLine("2 - Quadrado");
                Console.WriteLine("3 - Elipse");
                Console.WriteLine("4 - Círculo");
                Console.WriteLine("0 - Sair");
                Console.Write("Informe a opção desejada: ");
                char opcao = Console.ReadKey().KeyChar;
                Console.WriteLine();

                switch (opcao)
                {
                    case '0':
                        break;
                    case '1': //retângulo
                        vl1 = Ler<Double>("Digite o valor do lado do retângulo: ");
                        vl2 = Ler<Double>("Digite o valor da altura do retângulo: ");
                        fig = new Retangulo(vl1, vl2);
                        fig.CalcArea();
                        Console.WriteLine("A área do retângulo é {0}.", fig.Area);
                        break;
                    case '2'://quadrado
                        vl1 = Ler<Double>("Digite o valor do lado do quadrado: ");
                        fig = new Quadrado(vl1);
                        fig.CalcArea();
                        Console.WriteLine("A área do quadrado é {0}.", fig.Area);
                        break;
                    case '3'://elipse
                        vl1 = Ler<Double>("Digite o valor do raio1 da elipse: ");
                        vl2 = Ler<Double>("Digite o valor do raio2 da elipse: ");
                        fig = new Elipse(vl1, vl2);
                        fig.CalcArea();
                        Console.WriteLine("A área da elipse é {0}.", fig.Area);
                        break;
                    case '4'://círculo
                        vl1 = Ler<Double>("Digite o valor do raio do círculo: ");
                        fig = new Circulo(vl1);
                        fig.CalcArea();
                        Console.WriteLine("A área do círculo é {0}.", fig.Area);
                        break;
                    default:
                        fig = null;
                        Console.WriteLine("Opção inválida.");
                        break;
                }
                if (fig != null)
                {
                    figuras.Add(fig);
                }
                #endregion
                Console.Write("\nDeseja sair da aplicação? (S/N) ");
                char op = Console.ReadKey().KeyChar;
                if (op == 'S' || op == 's')
                {
                    sair = true;
                }
            } while (!sair);
            Console.WriteLine();
            foreach (FiguraGeometrica fg in figuras)
            {
                Console.WriteLine("A área de {0} é {1}", fg.ToString(), fg.Area);
                if (fg.GetType() == typeof(Retangulo))
                {
                    Console.WriteLine("É um retângulo");
                }
                if (fg is Retangulo)
                {
                    Console.WriteLine("O perímetro é {0}", ((Retangulo)fg).Perimetro());
                }
            }
        }
    }
}
