//Simple little loop that prints the dynamic values of the following decimals

public static decimal DeciValueOne { get; set; }
public static decimal DeciValueTwo { get; set; }

void GetArrayValue() {
        decimal[] ItemsToNone = new decimal[] { DeciValueOne, DeciValueTwo };   //Declare array

        for (int i = 0; i < ItemsToNone.Length; i++)                            //Loop over the arrays
        {
            Debug.WriteLine(ItemsToNone.GetValue(i));                           //Print out the values
        }
}