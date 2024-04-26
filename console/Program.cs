using Python.Runtime;
using System;

namespace ConsoleTest
{
  class Program
  {
    public static void Main(string[] args)
    {
      var root = Directory.GetCurrentDirectory();
      var dotenv = Path.Combine(root, ".env");
      Console.WriteLine(dotenv);
      DotEnv.Load(dotenv);
      var file = root + @"/server/server.py";
      Console.WriteLine(file);
      var url = Environment.GetEnvironmentVariable("SUPABASE_URL");
      var key = Environment.GetEnvironmentVariable("SUPABASE_KEY");
      Console.WriteLine("Enter your email:");
      string email = Console.ReadLine();
      Console.WriteLine("Enter your password:");
      string password = Console.ReadLine();
      pyscript(file, email, password, url, key);
    }
    public static void pyscript(string file, string email, string password, string url, string key)
    {
      Runtime.PythonDLL = @"/usr/lib/x86_64-linux-gnu/libpython3.10.so.1.0";
      PythonEngine.Initialize();
      Py.GIL();
      using (var scope = Py.CreateScope())
      {
        string code = File.ReadAllText(file);
        var compiled = PythonEngine.Compile(code, file);
        scope.Execute(compiled);
        PyObject script = scope.Get("Supabase");
        var userEmail = new PyString(email);
        var userPassword = new PyString(password);
        var supaUrl = new PyString(url);
        var supaKey = new PyString(key);
        script.InvokeMethod("client", new PyObject[] { supaUrl, supaKey });
        PyObject value = script.InvokeMethod("signIn", new PyObject[] { userEmail, userPassword });
        Console.WriteLine(value);
      }
    }
  }
}
