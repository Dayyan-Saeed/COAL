#include<iostream>
using namespace std;

int main()
{
	unsigned char Array1[80];
	unsigned char Array2[80];
	unsigned char Array3[80];

	for (int i = 0; i < 80; i++)
	{	
		Array1[i] = 49;
		Array2[i] = 5;
	}

	for (int i = 0; i < 80; i += 8)
	{
		__asm
		{
			mov esi , i
			movq mm0, [Array1 + esi]
			movq mm1, [Array2 + esi]
			paddb mm0, mm1
			movq [Array3 + esi] , mm0
		}
	}

	for (int i = 0; i < 80; i++)
	{
		cout << Array3[i] << endl;
	}

	system("pause");

	return 0;
}