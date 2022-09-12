# Prometheus docker image
##### Imagem docker do prometheus para estudo e testes com a ferramenta

### Imagem base utilizada
##### A criação da imagem utilizou como base uma imagem criada por Jeferson Fernando - Badtuxx
[Click aqui para acessar o repositório da imagem criada pelo badtuxx](https://github.com/badtuxx/prometheus_alpine)



## Instruções de uso: 

### Para executar o container utilize o comando:
```
# docker container run -d --name myprometheus -p 9090:9090 imagename:latest
```

### Acesso à interface web do prometheus:
```
# Acesso à interface web através do link: http://localhost:9090
```