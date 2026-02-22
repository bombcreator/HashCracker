using System;
using System.Collections.Generic;
using System.Security.Cryptography;
using System.Text;

namespace HashCrackLab.Core.crypto
{
    public static class Hashing
    {
        public static string Sha256Hex(string input)
        {
            var bytes = Encoding.UTF8.GetBytes(input);
            var hash = SHA256.HashData(bytes);
            return Convert.ToHexStringLower(hash);
        }
    }
}
