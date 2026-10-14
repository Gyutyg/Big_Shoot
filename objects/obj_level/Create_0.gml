//Contador de sequencias para aumentar a dificuldade do jogo
	contador = 0;

//Criando o array das sequencias
	waves1 = [seq_wave1, sq_wave1b, seq_wave2, seq_wave2b, seq_wave3,seq_wave4];
	waves2 = [seq_wave5, seq_wave6, seq_wave8, seq_wave7];
	rival = seq_rival;
	
	
	
//Indice que representa qual sequencia deve ser invocada 
//Se o contador for menor que 5
//Wave 1

	indice1 = 0;
	indice2 = 0;
	
	alarm[0] = 	180;


#region Metodos

nivel_wave = function()
{
	if(indice1 < array_length(waves1) -1)
	{
	
		//Criando a wave de nivel 1
		layer_sequence_create("Wave_inimigos", 0, 0, waves1[indice1]);
		indice1++
		//Tocando o alarme novamente;
		alarm[0] = 	300;
	}	
	else exit
	
	if(indice1 >= array_length(waves1) -1)
	{
	
		alarm[1] = 360

	}
	
	
}



#endregion