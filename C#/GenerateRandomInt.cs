//Void that generates a random number
//Call by using RandomInt(0, 100) where 0 is the minimum number and 100 the max

public static int GetRandom { get; set; }

void RandomInt(int MinRandom, int MaxRandom)
{
    Random r = new Random();
    GetRandom = r.Next(MinRandom, MaxRandom);
}