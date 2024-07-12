use rustler::{Encoder, Env, NifResult, Term};

mod atoms {
    rustler::atoms! {
        ok
    }
}

rustler::init! { "x_nif" }

#[rustler::nif]
fn hello(env: Env) -> NifResult<Term> {
    let msg = format!("hello from the other side (^_^)/~");
    let ret = (atoms::ok(), msg).encode(env);
    eprintln!(">>> [rust] returning hello: {:?}", &ret);
    Ok(ret)
}

#[rustler::nif]
fn add(env: Env, a: u64, b: u64) -> NifResult<Term> {
    let ret = (a + b).encode(env);
    eprintln!(">>> [rust] returning: {:?}", &ret);
    Ok(ret)
}
