using System;
using System.IO;
using System.Net;

namespace ConsoleApp2_TlsTest
{
    class Program
    {
        static void Main(string[] args)
        {
            //System.Net.ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12 | SecurityProtocolType.Tls11 | SecurityProtocolType.Tls; // comparable to modern browsers
            System.Net.ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
            var response = WebRequest.Create("https://www.howsmyssl.com/").GetResponse();
            var body = new StreamReader(response.GetResponseStream()).ReadToEnd();
            Console.WriteLine(body);
        }
    }
}
