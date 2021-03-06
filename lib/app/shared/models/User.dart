class User {
  String nome;
  String onesignalId;
  String role;
  String uid;
  double peso;
  int idade;

  User({
    this.nome,
    this.onesignalId,
    this.role,
    this.uid,
    this.peso,
    this.idade,
  });

  User.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    onesignalId = json['onesignal_id'];
    role = json['role'];
    uid = json['uid'];
    peso = json['peso'];
    idade = json['idade'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['onesignal_id'] = this.onesignalId;
    data['role'] = this.role;
    data['uid'] = this.uid;
    data['peso'] = this.peso;
    data['idade'] = this.idade;
    return data;
  }
}
