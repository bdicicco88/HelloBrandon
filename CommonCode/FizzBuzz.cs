using System;
using NUnit.Framework;
namespace test
{
    [TestFixture]
    class FizzBuzzTest
    {
        [TestCase(1, "1", 
            Description = "Test")]
        [TestCase(3, "Fizz")]
        [TestCase(5, "Buzz")]
        [TestCase(15, "FizzBuzz")]
        [TestCase(16, "16")]
        public void IsFizzBuzz(int inputNumber, string expected)
        {
            var fizzBuzz = new FizzBuzz();
            var returnValue = fizzBuzz.GetOutput(inputNumber);
            Assert.That(returnValue.ToUpper() == expected.ToUpper());
        }
    }
    public class FizzBuzz
    {
        public string GetOutput(int inputNumber)
        {
            var returnStr = "";
            if (inputNumber % 3 == 0)
            {
                returnStr += "FIZZ";
            }
			if (inputNumber % 5 == 0)
            {
	            returnStr += "BUZZ";
            }
            if (String.IsNullOrEmpty(returnStr))
            {
                returnStr = inputNumber.ToString();
            }
	        return returnStr;
        }
        public void Do()
        {
            for (int i = 0; i < 100; i++)
            {
                var returnValue = GetOutput(i);
                Console.WriteLine(returnValue);
            }
        }
    }
}
