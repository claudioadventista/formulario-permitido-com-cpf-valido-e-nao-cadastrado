<style>
    .container{
        border:solid 1px #ccc;
        border-radius:5px;
        margin:1% auto;
        width:500px;
        padding:0 30px 30px 30px;
        font-family: arial;
        background:#f3f781;
    }
    #form{
        display:none;
    }
    .enviar{
        width:175px;
        cursor:pointer;
    }
    .input{
        width:480px;
    }
    #messages{
        color:red;
        font-weight:bold;
    }
    .form{
        background:#ffa;
        padding:10px;
    }
</style>

<div class="container">
    <h4><center>Cadastro com campos válidos em Javascript</center></h4>
    <form class="form" method="post" action="index.php">
        <div>C P F</div>
        <input id="cpf" type="text" maxlength="11" onkeyup="validar()"  
        onkeypress="return event.charCode >= 48 && event.charCode <= 57" autofocus autocomplete="off" >
        <span id="messages"></span>
        <div id="form">
            <div>N o m e</div>
            <input class="input" id="nome"  type="text" maxlength="60" name="nome" autocomplete="off" >
            <div>T e l e f o n e</div>
            <input class="input" type="text" maxlength="14" name="telefone" autocomplete="off" >
            <div>E n d e r e ç o</div>
            <input class="input" type="text" maxlength="100" name="endereco" autocomplete="off" ><p>
            <input type="submit" class="enviar" value="E N V I A R" onclick="return nomeCompleto()">
        </div>
    </form>
</div>
       
<script>
    function validaCPF(cpf) {
        if (typeof cpf !== 'string' || cpf == 12345678909) return false
        cpf = cpf.replace(/[^\d]+/g, '')
        if (cpf.length !== 11 || !!cpf.match(/(\d)\1{10}/)) return false
        cpf = cpf.split('')
        const validator = cpf
            .filter((digit, index, array) => index >= array.length - 2 && digit)
            .map( el => +el )
        const toValidate = pop => cpf
            .filter((digit, index, array) => index < array.length - pop && digit)
            .map(el => +el)
        const rest = (count, pop) => (toValidate(pop)
            .reduce((soma, el, i) => soma + el * (count - i), 0) * 10) % 11 % 10
        return !(rest(10,2) !== validator[0] || rest(11,1) !== validator[1])
    };
    
    // Função que inicia a validação do CPF.
    function validar(){
        // Confirma se o campo CPF permanece com onze caracteres.
        if(cpf.value.length == 11){
            // Verifica se o CPF é válido, em caso positivo, passa para a próxima validação.
            if(validaCPF(cpf.value)){
                // Verifica se o CPF já foi cadastrado no banco.
                fetch('http://localhost:80/passando-o-codigo/fetch-php/verifica.php?busca=' + cpf.value)                 
                
                .then(response => { 
                    // Se houver uma response ok...             
                    if (response.ok) {  
                        // Converte o resultado para um objeto json.                 
                        return response.json();                       
                    }
                })

                .then(json => {
                    // Se houver um resultado encontrado...
                    if(json.cpf){
                        // Mostra a mensagem abaixo.
                        messages.innerHTML =  "O CPF já esta cadastrado"; 
                    }                            
                })

                .catch(error => { 
                    // Erro na busca, ou seja, não encontrou nada referente.
                    // Abre o form, se não encontrar o CPF no banco.
                    form.style.display = "block";
                    // Muda o foco para o campo nome.
                    nome.focus();                                              
                });
                // fim da verificação do cpf no banco.

            }else{
                messages.innerHTML="CPF invalido";
            };   
        }else{
            form.style.display = "none";
            messages.innerHTML="";
        };
    };  

    function nomeCompleto(){
            if(nome.value.indexOf(' ') < 0 ){
                nome.focus();
                messages.innerHTML= 'Digite o nome completo';
                return false;   
            };
        };
</script>