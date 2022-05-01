/*模型层：数据库的CURD*/
let mysql = require("mysql2");  //第三方包：mysql

//创建数据库连接
function getCoon(){
  return mysql.createConnection({
    host: "localhost",
    user: "root",
    password:"123456",
    database: "test"
  });
};

//新增
function add(table,data={}){  //data={username:"yss",password:"123"}
	let cols = "";
	let vals = "";
	Object.entries(data).forEach(([k,v])=>{
		cols += k + ",";
		vals += `"${v}",`;
	})
	cols = cols.slice(0,-1);
	vals = vals.slice(0,-1);
	let sql = `INSERT INTO ${table}(${cols}) VALUES(${vals})`;
	return new Promise((resolve,reject)=>{
		getCoon().query(sql,(err,result)=>{
			if(err) reject(err);
			resolve(result);
		})
	})
}

//查询单张表
function search(table,where=0,fileds="*",order=""){
	let sql = `SELECT ${fileds} FROM ${table}`;
	sql = where ? sql += " WHERE "+where : sql;
  // console.log(sql);
  if(order)
    sql += " ORDER BY "+order;
	return new Promise((resolve,reject)=>{
		getCoon().query(sql,(err,result)=>{
			if(err) reject(err);
			resolve(result);
		})
	});
}

//更新数据
function update(table,data,where=0){ //data={name:val,name2:val2}
	// console.log(data);
	let sql = `UPDATE ${table} SET`;
	for(let [name,val] of Object.entries(data)){
		sql += ` ${name}="${val}",`;
	}
	sql = sql.slice(0,-1);
	sql = where ? sql += ` WHERE `+where : sql;
	// console.log(sql);
	return new Promise((resolve,reject)=>{
		getCoon().query(sql,(err,result)=>{
			if(err) reject(err);
			resolve(result);
		})
	});
}

//删除数据
function del(table,where=0){
	let sql = `DELETE FROM ${table}`;
	sql = where ? sql += " WHERE "+where : sql;
	return new Promise((resolve,reject)=>{
		getCoon().query(sql,(err,result)=>{
			if(err) reject(err);
			resolve(result);
		})
	});
}

module.exports = {add,search,del,update}
