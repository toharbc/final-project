﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using BLL;
using DTO;

namespace API.Controllers
{
    [EnableCors("*","*","*")]
    public class UsersController : ApiController
    {
        UsersBLL usersBLL = new UsersBLL();

        [HttpGet]
        // GET: api/Users
        public List<UserDTO> GetAllUsers()
        {
            return usersBLL.GetAllUsers();
        }

        [HttpGet]
        // GET: api/Users
        public long Login(string mail, string password)
        {
            return usersBLL.Login(mail, password);
        }
        // POST: api/Users
        [HttpPost]
        public void AddUser([FromBody]UserDTO user)
        {
             usersBLL.AddUser(user);
        }

       

       
    }
}
