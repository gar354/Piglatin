public void setup() 
{
	String[] lines = loadStrings("words.txt");
	System.out.println("there are " + lines.length + " lines");
	for (int i = 0 ; i < lines.length; i++)
	{
	  System.out.println(pigLatin(lines[i]));
	}
}

public int findFirstVowel(String sWord)
//precondition: sWord is a valid String of length greater than 0.
//postcondition: returns the position of the first vowel in sWord.  If there are no vowels, returns -1
{
	for (int i = 0; i < sWord.length(); i++)
	{
		String firstChar = sWord.substring(i,i + 1);
		if (firstChar.equals("i") || firstChar.equals("o") || firstChar.equals("u") || firstChar.equals("e") || firstChar.equals("a"))
		{
			return i;
		}
	}
	return -1;
}

public String pigLatin(String sWord)
//precondition: sWord is a valid String of length greater than 0
//postcondition: returns the pig latin equivalent of sWord
{
	switch (findFirstVowel(sWord))
	{
		case -1:
			return sWord + "ay";
		case 0:
			return sWord + "way";
		case 1:
			if (sWord.substring(0,2).equals("qu")) {
				return sWord.substring(2,sWord.length()) + "quay";
			}
			break;
		case 2:
			return sWord.substring(2, sWord.length()) + sWord.substring(0,2) + "ay";
		case 3:
			return sWord.substring(3, sWord.length()) + sWord.substring(0,3) + "ay";
	}
	return sWord.substring(1, sWord.length()) + sWord.substring(0,1) + "ay";
}
