//Find All indexes for a substring in String
int index = 0;
string message = "This is a string of string of string."
string searchStr =  "string"
List<int> indexes = new List<int>;

while ((index = message.IndexOf(searchStr, index)) != -1)
{
    indexes.add(index);
    index++;
}
