public string StringBuilderTest()
{
    string prefix = "";
    StringBuilder sb = new StringBuilder();
    for (int i = 0; i < message.Length; i++)
    {
        if(message[i].ToString() == prefix)
        {
            sb.Append("$");
        }
        else
        {
            sb.Append(message[i]);
        }
        
    }
    
    return sb.ToString();
}