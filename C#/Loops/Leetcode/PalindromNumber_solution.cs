public class Solution {
    public bool IsPalindrome(int x) {
        var s = x.ToString();
        bool result = int.TryParse(s, out int n);

         StringBuilder reversed = new StringBuilder(s.Length);
        for (int i = s.Length - 1; i >= 0; i--)
        {
            reversed.Append(s[i]);
        }

        if( result && s ==  reversed.ToString() )
        {
            return true;
        }
        return false;
    }
}