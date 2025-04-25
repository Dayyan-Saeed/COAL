#include<iostream>
using namespace std;

int main()
{
	int IntegerArray[] = { 6, 2, 6, 2, 6 };

	for (int i = 0; i < 20; i = i + 4)
	{
		__asm
		{
			mov esi, i
			mov eax, [IntegerArray + esi]
			rol al, 4
			ror eax, 24
			rol al, 4
			rol eax, 24
			ror eax, 8
			ror al, 4
			rol eax, 8
			ror eax, 16
			ror al, 4
			rol eax, 16
			mov[IntegerArray + esi], eax
		}
	}

	for (int i = 0; i < 5; i++)
	{
		cout << IntegerArray[i] << " " << endl;
	}
		
	return 0;
}