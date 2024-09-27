import { createSlice, createAsyncThunk } from "@reduxjs/toolkit";
import axios from "axios";
import { useNavigate } from "react-router-dom";
import Swal from "sweetalert2";


const url = "https://63e9ae764f3c6aa6e7d06a70.mockapi.io/users";
// const navigate =useNavigate()



const initialState = {
  users: [],
  status: "start",
  error: null,
};


export const createUsers = createAsyncThunk(
  "users/createUsers",
  async (u) => {
    const res = await axios.post(url, u);
    return res.data;
  }
);
export const fecthUsers = createAsyncThunk('users/fecthUsers', async () => {
  // const res = await axios.get(`${url}?page=${page}&&limit=5`)
  const res = await axios.get(`${url}`)
  return res.data
})
let data = []
axios.get(url)
  .then(function (res) {
    data = res.data
  })
  .catch(function (error) {
    console.log(error)
  })


  
const usersSlice = createSlice({
  name: "users",
  initialState,
  reducers: {
    signIn: (state, action) => {
      const user = state.users.find(item => item.email === action.payload.email)
      console.log(user)
      if(user){
        // let a="true"
        if(user.pwd===action.payload.pwd){
          // window.location.reload()
          localStorage.setItem("login", JSON.stringify(user))
        }else{
          Swal.fire({
            position: "top-end",
            icon: "error",
            title: `Sai tài khoản or mật khẩu`,
            showConfirmButton: false,
            timer: 1000,
          });
        }    
      }else{
        Swal.fire({
          position: "top-end",
          icon: "error",
          title: `Tài khoản không tồn tại `,
          showConfirmButton: false,
          timer: 1000,
        });
      }
      // const o = "haooaoaooaodadaoo"
      // console.log(a)
    },
  },
  extraReducers: (builder) => {
    builder
      .addCase(fecthUsers.pending, (state) => {
        state.status = 'loading'
      })
      .addCase(fecthUsers.fulfilled, (state, action) => {
        state.status = 'succeeded'
        state.users = action.payload
      })
      .addCase(fecthUsers.rejected, (state, action) => {
        state.status = 'failed'
        state.users = action.error.payload
      })
    .addCase(createUsers.fulfilled, (state, action) => {
      state.users = [...state.users, action.payload];
    });
    // .addCase(reCheck.fulfilled, (state, action) => {
    //     state.cats = state.cats.map(item => item.id === action.payload.id ? { ...item, status: !item.status } : item)
    // })
  },
});

export const { signIn } = usersSlice.actions;
export default usersSlice.reducer;
