#include<iostream>
using namespace std;

int main()
{
	int IntegerArray[] = { 6,2,6,2,6 };

	for (int i = 0; i < 20; i = i + 4)
	{
		__asm
		{
			mov esi, i
			mov eax, [IntegerArray + esi]
			mov ebx, eax
			and ebx, 0x00ff0000
			rol ebx, 16
			rol bl, 4
			rol eax, 16
			mov al, bl
			ror eax, 16
			mov bl, al
			rol eax, 8
			mov dl, al
			mov al, bl
			ror eax, 8
			mov al, dl
			mov[IntegerArray + esi], eax
		}
	}

	for (int i = 0; i < 5; i++)
		cout << IntegerArray[i] << " " << endl;

	return 0;
}