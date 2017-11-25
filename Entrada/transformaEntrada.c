#include <stdio.h>
#define MAXCHAR 1000;
int main()
{
	FILE *entrada, *saida;
	char *result;
	char Linha[MAXCHAR]
	int contador, i;
	Linha[0] = \0;
	entrada = fopen("Entrada.txt", "rt");
	saida = fopen("EntradaCerta.txt", "wt");
	
	if(entrada == NULL || saida ==NULL)
	{
		printf("Erro ao abrir o arquivo\n");
	}
	
	while(!feof(entrada))
	{
		result = fgets(Linha, MAXCHAR, entrada);
		if(result)
		{
			i= 0;
			contador = 0;
			while(Linha[i]!=\0)//enquanto nao chego no final da linha
			{
				if(Linha[i] >= '0' && Linha[i] <= '9')//se eh um numero ainda estou no mesmo elemento
				{
					i++;
					continue;
				}
				if(Linha[i] == '.')//se eh um ponto tbm estou no mesmo elemento
				{
					i++;
					continue;
				}
				while(Linha[i]==' ' || Linha[i]=='	')//se eh um espaço eh pq estou trocando de elemento
				{
					i++;
				}
				if(Linha[i] >= '0' && Linha[i] <= '9')//quando atinjo o numero adiciono um ao numero de elementos
				{
					cont++;
				}
			}
			if(cont == 3)
			{
				fputs(Linha, saida);
			}
		}
	}
	
	fclose(entrada);
	fclose(saida);
	
}
