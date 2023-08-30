using MySql.Data.MySqlClient;
using SQLUpdate;
using Newtonsoft.Json;
using Npgsql;

config getconfig()
{
    try
    {
        string pathWithFileName = Path.Combine(System.IO.Directory.GetCurrentDirectory(), "config.txt");
        string jsonValue = File.ReadAllText(pathWithFileName);
        config myDeserializedClass = JsonConvert.DeserializeObject<config>(jsonValue);
        return myDeserializedClass;
    }
    catch (Exception e)
    {
        Console.WriteLine(e + "\n");
    }
    return null;
}

var x = getconfig();

Console.WriteLine("Getting Connection ...");

//var connectionString = "server=localhost;uid=root;pwd=;database=update";
var connectionString = x.Connection_String;

NpgsqlConnection conn = new NpgsqlConnection(connectionString);
NpgsqlTransaction tr = null;

//MySqlConnection conn = new MySqlConnection(connectionString);
//MySqlTransaction tr = null;

try
{
    Console.WriteLine("Openning Connection ...");

    conn.Open();
    Console.WriteLine("Connection successful!");
    tr = conn.BeginTransaction();

    string sql = File.ReadAllText(x.url);
    
    NpgsqlCommand cmd = new NpgsqlCommand(sql, conn);
    cmd.Transaction = tr;

    cmd.ExecuteNonQuery();
    tr.Commit();
    Console.WriteLine("Update successful!");
}
catch (NpgsqlException ex)
{
    Console.WriteLine("Error in query call");
    Console.WriteLine(ex);
    try
    {
        Console.WriteLine("Rollback called");
        tr.Rollback();
        Console.WriteLine("Rollback succesfull");
    }
    catch (NpgsqlException ex1)
    {
        Console.WriteLine("Rollback Error");
        Console.WriteLine(ex1);
    }
}

Environment.Exit(0);