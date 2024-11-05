using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using RestSharp;
using RestSharpAPI.APIClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static System.Runtime.InteropServices.JavaScript.JSType;
internal class Program
{
    private static async Task Main(string[] args)
    {
        string apiUrl = "https://httpbin.org";
        string token = string.Empty;
        var restClient = new APIClient(apiUrl, token);
        // Get Example
        string GetEndPoint = "/get";
        var getResponse = await restClient.GetRequest(GetEndPoint);
        Console.WriteLine("Get Example Response");
        Console.WriteLine(getResponse);

        // Post Example
        string PostEndPoint = "/post";
        // Create Test Data
        var data = @"{""AppName"": ""TestAPI""}";
        var postResponse = await restClient.PostRequest(PostEndPoint, data);
        Console.WriteLine("Post Example Response");
        Console.WriteLine(postResponse);
    }
}