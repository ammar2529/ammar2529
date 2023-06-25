using System;
using System.IO;
using System.Security.Cryptography;
using System.Text;

namespace WebProject.AsyncWidgets.Utility
{
//        public class Encrypttion
//        {

//            public static void DecryptFile(string FileLocation, string FileDestination, string Password)
//            {
//                bool flag;
//                int i1;

//                System.Security.Cryptography.RijndaelManaged rijndaelManaged = new System.Security.Cryptography.RijndaelManaged();
//                System.IO.FileStream fileStream1 = new System.IO.FileStream(FileLocation, System.IO.FileMode.Open, System.IO.FileAccess.Read);
//                System.IO.FileStream fileStream2 = new System.IO.FileStream(FileDestination, System.IO.FileMode.Create, System.IO.FileAccess.Write);
//                int i2 = Password.Length;
//                byte[] bArr = System.Text.Encoding.ASCII.GetBytes(i2.ToString());
//                System.Security.Cryptography.PasswordDeriveBytes passwordDeriveBytes = new System.Security.Cryptography.PasswordDeriveBytes(Password, bArr);
//                System.Security.Cryptography.ICryptoTransform icryptoTransform = rijndaelManaged.CreateDecryptor(passwordDeriveBytes.GetBytes(32), passwordDeriveBytes.GetBytes(16));
//                System.Security.Cryptography.CryptoStream cryptoStream = new System.Security.Cryptography.CryptoStream(fileStream1, icryptoTransform, System.Security.Cryptography.CryptoStreamMode.Read);
//                try
//                {
//                    try
//                    {
//                        while (flag)
//                        {
//                            fileStream2.WriteByte((byte)i1);
//                            i1 = cryptoStream.ReadByte();
//                            flag = cryptoStream.ReadByte() != -1;
//                        }
//                    }
//                    catch (System.Exception e)
//                    {
//                        throw e;
//                    }
//                }
//                finally
//                {
//                    cryptoStream.Close();
//                    fileStream1.Close();
//                    fileStream2.Close();
//                }
//            }

//            public static  string DecryptString(string InputText, string Password)
//            {
//                System.Security.Cryptography.RijndaelManaged rijndaelManaged = new System.Security.Cryptography.RijndaelManaged();
//                byte[] bArr1 = System.Convert.FromBase64String(InputText);
//                int i2 = Password.Length;
//                byte[] bArr2 = System.Text.Encoding.ASCII.GetBytes(i2.ToString());
//                System.Security.Cryptography.PasswordDeriveBytes passwordDeriveBytes = new System.Security.Cryptography.PasswordDeriveBytes(Password, bArr2);
//                System.Security.Cryptography.ICryptoTransform icryptoTransform = rijndaelManaged.CreateDecryptor(passwordDeriveBytes.GetBytes(32), passwordDeriveBytes.GetBytes(16));
//                System.IO.MemoryStream memoryStream = new System.IO.MemoryStream(bArr1);
//                System.Security.Cryptography.CryptoStream cryptoStream = new System.Security.Cryptography.CryptoStream(memoryStream, icryptoTransform, System.Security.Cryptography.CryptoStreamMode.Read);
//                byte[] bArr3 = new byte[bArr1.Length];
//                int i1 = cryptoStream.Read(bArr3, 0, bArr3.Length);
//                memoryStream.Close();
//                cryptoStream.Close();
//                return System.Text.Encoding.Unicode.GetString(bArr3, 0, i1);
//            }

//            public static void EncryptFile(string FileLocation, string FileDestination, string Password)
//            {
//                bool flag;
//                int i1;

//                System.Security.Cryptography.RijndaelManaged rijndaelManaged = new System.Security.Cryptography.RijndaelManaged();
//                System.IO.FileStream fileStream1 = new System.IO.FileStream(FileLocation, System.IO.FileMode.Open, System.IO.FileAccess.Read);
//                System.IO.FileStream fileStream2 = new System.IO.FileStream(FileDestination, System.IO.FileMode.Create, System.IO.FileAccess.Write);
//                int i2 = Password.Length;
//                byte[] bArr = System.Text.Encoding.ASCII.GetBytes(i2.ToString());
//                System.Security.Cryptography.PasswordDeriveBytes passwordDeriveBytes = new System.Security.Cryptography.PasswordDeriveBytes(Password, bArr);
//                System.Security.Cryptography.ICryptoTransform icryptoTransform = rijndaelManaged.CreateEncryptor(passwordDeriveBytes.GetBytes(32), passwordDeriveBytes.GetBytes(16));
//                System.Security.Cryptography.CryptoStream cryptoStream = new System.Security.Cryptography.CryptoStream(fileStream2, icryptoTransform, System.Security.Cryptography.CryptoStreamMode.Write);
//                try
//                {
//                    try
//                    {
//                        while (flag)
//                        {
//                            cryptoStream.WriteByte((byte)i1);
//                            i1 = fileStream1.ReadByte();
//                            flag = fileStream1.ReadByte() != -1;
//                        }
//                    }
//                    catch (System.Exception e)
//                    {
//                        throw e;
//                    }
//                }
//                finally
//                {
//                    cryptoStream.Close();
//                    fileStream1.Close();
//                    fileStream2.Close();
//                }
//            }

//            public static string EncryptString(string InputText, string Password)
//            {
//                System.Security.Cryptography.RijndaelManaged rijndaelManaged = new System.Security.Cryptography.RijndaelManaged();
//                byte[] bArr1 = System.Text.Encoding.Unicode.GetBytes(InputText);
//                int i = Password.Length;
//                byte[] bArr2 = System.Text.Encoding.ASCII.GetBytes(i.ToString());
//                System.Security.Cryptography.PasswordDeriveBytes passwordDeriveBytes = new System.Security.Cryptography.PasswordDeriveBytes(Password, bArr2);
//                System.Security.Cryptography.ICryptoTransform icryptoTransform = rijndaelManaged.CreateEncryptor(passwordDeriveBytes.GetBytes(32), passwordDeriveBytes.GetBytes(16));
//                System.IO.MemoryStream memoryStream = new System.IO.MemoryStream();
//                System.Security.Cryptography.CryptoStream cryptoStream = new System.Security.Cryptography.CryptoStream(memoryStream, icryptoTransform, System.Security.Cryptography.CryptoStreamMode.Write);
//                cryptoStream.Write(bArr1, 0, bArr1.Length);
//                cryptoStream.FlushFinalBlock();
//                byte[] bArr3 = memoryStream.ToArray();
//                memoryStream.Close();
//                cryptoStream.Close();
//                return System.Convert.ToBase64String(bArr3);
//            }

//        } 
//    ///////////////////////////////////////////////////////////////////////////////
//// SAMPLE: Hashing data with salt using MD5 and several SHA algorithms.
////
//// To run this sample, create a new Visual C# project using the Console
//// Application template and replace the contents of the Class1.cs file with
//// the code below.
////
//// THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND,
//// EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED
//// WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR PURPOSE.
//// 
//// Copyright (C) 2002 Obviex(TM). All rights reserved.
//// 

/// <summary>
/// This class generates and compares hashes using MD5, SHA1, SHA256, SHA384, 
/// and SHA512 hashing algorithms. Before computing a hash, it appends a
/// randomly generated salt to the plain text, and stores this salt appended
/// to the result. To verify another plain text value against the given hash,
/// this class will retrieve the salt value from the hash string and use it
/// when computing a new hash of the plain text. Appending a salt value to
/// the hash may not be the most efficient approach, so when using hashes in
/// a real-life application, you may choose to store them separately. You may
/// also opt to keep results as byte arrays instead of converting them into
/// base64-encoded strings.
/// </summary>
public class Hashing
{
    public enum HashType{
    MD5=0,
SHA1=1,
SHA256,
SHA384,
        SHA512,
    }
    /// <summary>
    /// Generates a hash for the given plain text value and returns a
    /// base64-encoded result. Before the hash is computed, a random salt
    /// is generated and appended to the plain text. This salt is stored at
    /// the end of the hash value, so it can be used later for hash
    /// verification.
    /// </summary>
    /// <param name="plainText">
    /// Plaintext value to be hashed. The function does not check whether
    /// this parameter is null.
    /// </param>
    /// <param name="hashAlgorithm">
    /// Name of the hash algorithm. Allowed values are: "MD5", "SHA1",
    /// "SHA256", "SHA384", and "SHA512" (if any other value is specified
    /// MD5 hashing algorithm will be used). This value is case-insensitive.
    /// </param>
    /// <param name="saltBytes">
    /// Salt bytes. This parameter can be null, in which case a random salt
    /// value will be generated.
    /// </param>
    /// <returns>
    /// Hash value formatted as a base64-encoded string.
    /// </returns>
    public static string ComputeHash(string   plainText,
                                     HashType hashAlgorithm,
                                     byte[]   saltBytes)
    {
        
        // If salt is not specified, generate it on the fly.
        if (saltBytes == null)
        {
            // Define min and max salt sizes.
            int minSaltSize = 4;
            int maxSaltSize = 8;

            // Generate a random number for the size of the salt.
            Random  random = new Random();
            int saltSize = random.Next(minSaltSize, maxSaltSize);

            // Allocate a byte array, which will hold the salt.
            saltBytes = new byte[saltSize];

            // Initialize a random number generator.
            RNGCryptoServiceProvider rng = new RNGCryptoServiceProvider();

            // Fill the salt with cryptographically strong byte values.
            rng.GetNonZeroBytes(saltBytes); 
        }
        
        // Convert plain text into a byte array.
        byte[] plainTextBytes = Encoding.UTF8.GetBytes(plainText);
        
        // Allocate array, which will hold plain text and salt.
        byte[] plainTextWithSaltBytes = 
                new byte[plainTextBytes.Length + saltBytes.Length];

        // Copy plain text bytes into resulting array.
        for (int i=0; i < plainTextBytes.Length; i++)
            plainTextWithSaltBytes[i] = plainTextBytes[i];
        
        // Append salt bytes to the resulting array.
        for (int i=0; i < saltBytes.Length; i++)
            plainTextWithSaltBytes[plainTextBytes.Length + i] = saltBytes[i];

        // Because we support multiple hashing algorithms, we must define
        // hash object as a common (abstract) base class. We will specify the
        // actual hashing algorithm class later during object creation.
        HashAlgorithm hash;
        
        
        // Initialize appropriate hashing algorithm class.
        switch (hashAlgorithm)
        {
            case HashType.SHA1:
                hash = new SHA1Managed();
                break;

            case HashType.SHA256:
                hash = new SHA256Managed();
                break;

            case HashType.SHA384:
                hash = new SHA384Managed();
                break;

            case HashType.SHA512:
                hash = new SHA512Managed();
                break;

            default:
                hash = new MD5CryptoServiceProvider();
                break;
        }
        
        // Compute hash value of our plain text with appended salt.
        byte[] hashBytes = hash.ComputeHash(plainTextWithSaltBytes);
        
        // Create array which will hold hash and original salt bytes.
        byte[] hashWithSaltBytes = new byte[hashBytes.Length + 
                                            saltBytes.Length];
        
        // Copy hash bytes into resulting array.
        for (int i=0; i < hashBytes.Length; i++)
            hashWithSaltBytes[i] = hashBytes[i];
            
        // Append salt bytes to the result.
        for (int i=0; i < saltBytes.Length; i++)
            hashWithSaltBytes[hashBytes.Length + i] = saltBytes[i];
            
        // Convert result into a base64-encoded string.
        string hashValue = Convert.ToBase64String(hashWithSaltBytes);
        
        // Return the result.
        return hashValue;
    }

    /// <summary>
    /// Compares a hash of the specified plain text value to a given hash
    /// value. Plain text is hashed with the same salt value as the original
    /// hash.
    /// </summary>
    /// <param name="plainText">
    /// Plain text to be verified against the specified hash. The function
    /// does not check whether this parameter is null.
    /// </param>
    /// <param name="hashAlgorithm">
    /// Name of the hash algorithm. Allowed values are: "MD5", "SHA1", 
    /// "SHA256", "SHA384", and "SHA512" (if any other value is specified,
    /// MD5 hashing algorithm will be used). This value is case-insensitive.
    /// </param>
    /// <param name="hashValue">
    /// Base64-encoded hash value produced by ComputeHash function. This value
    /// includes the original salt appended to it.
    /// </param>
    /// <returns>
    /// If computed hash mathes the specified hash the function the return
    /// value is true; otherwise, the function returns false.
    /// </returns>
    public static bool VerifyHash(string   plainText,
                                  HashType   hashAlgorithm,
                                  string   hashValue)
    {
        // Convert base64-encoded hash value into a byte array.
        byte[] hashWithSaltBytes = Convert.FromBase64String(hashValue);
        
        // We must know size of hash (without salt).
        int hashSizeInBits, hashSizeInBytes;
        
        // Make sure that hashing algorithm name is specified.
      
        
        // Size of hash is based on the specified algorithm.
        switch (hashAlgorithm)
        {
            case HashType.SHA1 :
                hashSizeInBits = 160;
                break;

            case HashType.SHA256:
                hashSizeInBits = 256;
                break;

            case HashType.SHA384:
                hashSizeInBits = 384;
                break;

            case HashType.SHA512:
                hashSizeInBits = 512;
                break;

            default: // Must be MD5
                hashSizeInBits = 128;
                break;
        }

        // Convert size of hash from bits to bytes.
        hashSizeInBytes = hashSizeInBits / 8;

        // Make sure that the specified hash value is long enough.
        if (hashWithSaltBytes.Length < hashSizeInBytes)
            return false;

        // Allocate array to hold original salt bytes retrieved from hash.
        byte[] saltBytes = new byte[hashWithSaltBytes.Length - 
                                    hashSizeInBytes];

        // Copy salt from the end of the hash to the new array.
        for (int i=0; i < saltBytes.Length; i++)
            saltBytes[i] = hashWithSaltBytes[hashSizeInBytes + i];

        // Compute a new hash string.
        string expectedHashString = 
                    ComputeHash(plainText, hashAlgorithm, saltBytes);

        // If the computed hash matches the specified hash,
        // the plain text value must be correct.
        return (hashValue == expectedHashString);
    }
}

/*
    [STAThread]
    static void Main(string[] args)
    {
        string password      = "myP@5sw0rd";  // original password
        string wrongPassword = "password";    // wrong password
 
        string passwordHashMD5 = 
               SimpleHash.ComputeHash(password, "MD5", null);
        string passwordHashSha1 = 
               SimpleHash.ComputeHash(password, "SHA1", null);
        string passwordHashSha256 = 
               SimpleHash.ComputeHash(password, "SHA256", null);
        string passwordHashSha384 = 
               SimpleHash.ComputeHash(password, "SHA384", null);
        string passwordHashSha512 = 
               SimpleHash.ComputeHash(password, "SHA512", null);

        Console.WriteLine("COMPUTING HASH VALUES\r\n");
        Console.WriteLine("MD5   : {0}", passwordHashMD5);
        Console.WriteLine("SHA1  : {0}", passwordHashSha1);
        Console.WriteLine("SHA256: {0}", passwordHashSha256);
        Console.WriteLine("SHA384: {0}", passwordHashSha384);
        Console.WriteLine("SHA512: {0}", passwordHashSha512);
        Console.WriteLine("");

        Console.WriteLine("COMPARING PASSWORD HASHES\r\n");
        Console.WriteLine("MD5    (good): {0}",
                            SimpleHash.VerifyHash(
                            password, "MD5", 
                            passwordHashMD5).ToString());
        Console.WriteLine("MD5    (bad) : {0}",
                            SimpleHash.VerifyHash(
                            wrongPassword, "MD5", 
                            passwordHashMD5).ToString());
        Console.WriteLine("SHA1   (good): {0}",
                            SimpleHash.VerifyHash(
                            password, "SHA1", 
                            passwordHashSha1).ToString());
        Console.WriteLine("SHA1   (bad) : {0}",
                            SimpleHash.VerifyHash(
                            wrongPassword, "SHA1", 
                            passwordHashSha1).ToString());
        Console.WriteLine("SHA256 (good): {0}",
                            SimpleHash.VerifyHash(
                            password, "SHA256", 
                            passwordHashSha256).ToString());
        Console.WriteLine("SHA256 (bad) : {0}",
                            SimpleHash.VerifyHash(
                            wrongPassword, "SHA256", 
                            passwordHashSha256).ToString());
        Console.WriteLine("SHA384 (good): {0}",
                            SimpleHash.VerifyHash(
                            password, "SHA384", 
                            passwordHashSha384).ToString());
        Console.WriteLine("SHA384 (bad) : {0}", 
                            SimpleHash.VerifyHash(
                            wrongPassword, "SHA384", 
                            passwordHashSha384).ToString());
        Console.WriteLine("SHA512 (good): {0}",
                            SimpleHash.VerifyHash(
                            password, "SHA512", 
                            passwordHashSha512).ToString());
        Console.WriteLine("SHA512 (bad) : {0}",
                            SimpleHash.VerifyHash(
                            wrongPassword, "SHA512", 
                            passwordHashSha512).ToString());
    }
}
*/



 
/// <summary>
/// This class uses a symmetric key algorithm (Rijndael/AES) to encrypt and
/// decrypt data. As long as it is initialized with the same constructor
/// parameters, the class will use the same key. Before performing encryption,
/// the class can prepend random bytes to plain text and generate different
/// encrypted values from the same plain text, encryption key, initialization
/// vector, and other parameters. This class is thread-safe.
/// </summary>
/// <remarks>
/// Be careful when performing encryption and decryption. There is a bug
/// ("feature"?) in .NET Framework, which causes corruption of encryptor/
/// decryptor if a cryptographic exception occurs during encryption/
/// decryption operation. To correct the problem, re-initialize the class
/// instance when a cryptographic exception occurs.
/// </remarks>
public class RijndaelEnhanced
{
    #region Private members
    // If hashing algorithm is not specified, use SHA-1.
    private static string  DEFAULT_HASH_ALGORITHM  = "SHA1";
 
    // If key size is not specified, use the longest 256-bit key.
    private static int     DEFAULT_KEY_SIZE        = 256;
 
    // Do not allow salt to be longer than 255 bytes, because we have only
    // 1 byte to store its length. 
    private static int     MAX_ALLOWED_SALT_LEN    = 255;
 
    // Do not allow salt to be smaller than 4 bytes, because we use the first
    // 4 bytes of salt to store its length. 
    private static int     MIN_ALLOWED_SALT_LEN    = 4;
 
    // Random salt value will be between 4 and 8 bytes long.
    private static int     DEFAULT_MIN_SALT_LEN    = MIN_ALLOWED_SALT_LEN;
    private static int     DEFAULT_MAX_SALT_LEN    = 8;
 
    // Use these members to save min and max salt lengths.
    private int     minSaltLen              = -1;
    private int     maxSaltLen              = -1;
 
    // These members will be used to perform encryption and decryption.
    private ICryptoTransform encryptor      = null;
    private ICryptoTransform decryptor      = null;
    #endregion
 
    #region Constructors
    /// <summary>
    /// Use this constructor if you are planning to perform encryption/
    /// decryption with 256-bit key, derived using 1 password iteration,
    /// hashing without salt, no initialization vector, electronic codebook
    /// (ECB) mode, SHA-1 hashing algorithm, and 4-to-8 byte long salt.
    /// </summary>
    /// <param name="passPhrase">
    /// Passphrase from which a pseudo-random password will be derived.
    /// The derived password will be used to generate the encryption key.
    /// Passphrase can be any string. In this example we assume that the
    /// passphrase is an ASCII string. Passphrase value must be kept in
    /// secret.
    /// </param>
    /// <remarks>
    /// This constructor is not recommended because it does not use
    /// initialization vector and uses the ECB cipher mode, which is less
    /// secure than the CBC mode.
    /// </remarks>
    public RijndaelEnhanced(string  passPhrase) : 
        this(passPhrase, null)
    {
    }
 
    /// <summary>
    /// Use this constructor if you are planning to perform encryption/
    /// decryption with 256-bit key, derived using 1 password iteration,
    /// hashing without salt, cipher block chaining (CBC) mode, SHA-1
    /// hashing algorithm, and 4-to-8 byte long salt.
    /// </summary>
    /// <param name="passPhrase">
    /// Passphrase from which a pseudo-random password will be derived.
    /// The derived password will be used to generate the encryption key.
    /// Passphrase can be any string. In this example we assume that the
    /// passphrase is an ASCII string. Passphrase value must be kept in
    /// secret.
    /// </param>
    /// <param name="initVector">
    /// Initialization vector (IV). This value is required to encrypt the
    /// first block of plaintext data. For RijndaelManaged class IV must be
    /// exactly 16 ASCII characters long. IV value does not have to be kept
    /// in secret.
    /// </param>
    public RijndaelEnhanced(string  passPhrase,
                            string  initVector) :
        this(passPhrase, initVector, -1)
    {
    }
 
    /// <summary>
    /// Use this constructor if you are planning to perform encryption/
    /// decryption with 256-bit key, derived using 1 password iteration,
    /// hashing without salt, cipher block chaining (CBC) mode, SHA-1 
    /// hashing algorithm, and 0-to-8 byte long salt.
    /// </summary>
    /// <param name="passPhrase">
    /// Passphrase from which a pseudo-random password will be derived.
    /// The derived password will be used to generate the encryption key
    /// Passphrase can be any string. In this example we assume that the
    /// passphrase is an ASCII string. Passphrase value must be kept in
    /// secret.
    /// </param>
    /// <param name="initVector">
    /// Initialization vector (IV). This value is required to encrypt the
    /// first block of plaintext data. For RijndaelManaged class IV must be
    /// exactly 16 ASCII characters long. IV value does not have to be kept
    /// in secret.
    /// </param>
    /// <param name="minSaltLen">
    /// Min size (in bytes) of randomly generated salt which will be added at
    /// the beginning of plain text before encryption is performed. When this
    /// value is less than 4, the default min value will be used (currently 4
    /// bytes).
    /// </param>
    public RijndaelEnhanced(string  passPhrase,
                            string  initVector,
                            int     minSaltLen) :
        this(passPhrase, initVector, minSaltLen, -1)
    {
    }
 
    /// <summary>
    /// Use this constructor if you are planning to perform encryption/
    /// decryption with 256-bit key, derived using 1 password iteration,
    /// hashing without salt, cipher block chaining (CBC) mode, SHA-1
    /// hashing algorithm. Use the minSaltLen and maxSaltLen parameters to
    /// specify the size of randomly generated salt.
    /// </summary>
    /// <param name="passPhrase">
    /// Passphrase from which a pseudo-random password will be derived.
    /// The derived password will be used to generate the encryption key.
    /// Passphrase can be any string. In this example we assume that the
    /// passphrase is an ASCII string. Passphrase value must be kept in
    /// secret.
    /// </param>
    /// <param name="initVector">
    /// Initialization vector (IV). This value is required to encrypt the
    /// first block of plaintext data. For RijndaelManaged class IV must be
    /// exactly 16 ASCII characters long. IV value does not have to be kept
    /// in secret.
    /// </param>
    /// <param name="minSaltLen">
    /// Min size (in bytes) of randomly generated salt which will be added at
    /// the beginning of plain text before encryption is performed. When this
    /// value is less than 4, the default min value will be used (currently 4
    /// bytes).
    /// </param>
    /// <param name="maxSaltLen">
    /// Max size (in bytes) of randomly generated salt which will be added at
    /// the beginning of plain text before encryption is performed. When this
    /// value is negative or greater than 255, the default max value will be
    /// used (currently 8 bytes). If max value is 0 (zero) or if it is smaller
    /// than the specified min value (which can be adjusted to default value),
    /// salt will not be used and plain text value will be encrypted as is.
    /// In this case, salt will not be processed during decryption either.
    /// </param>
    public RijndaelEnhanced(string  passPhrase,
                            string  initVector,
                            int     minSaltLen,
                            int     maxSaltLen) :
        this(passPhrase, initVector, minSaltLen, maxSaltLen, -1)
    {
    }
 
    /// <summary>
    /// Use this constructor if you are planning to perform encryption/
    /// decryption using the key derived from 1 password iteration,
    /// hashing without salt, cipher block chaining (CBC) mode, and
    /// SHA-1 hashing algorithm.
    /// </summary>
    /// <param name="passPhrase">
    /// Passphrase from which a pseudo-random password will be derived.
    /// The derived password will be used to generate the encryption key.
    /// Passphrase can be any string. In this example we assume that the
    /// passphrase is an ASCII string. Passphrase value must be kept in
    /// secret.
    /// </param>
    /// <param name="initVector">
    /// Initialization vector (IV). This value is required to encrypt the
    /// first block of plaintext data. For RijndaelManaged class IV must be
    /// exactly 16 ASCII characters long. IV value does not have to be kept
    /// in secret.
    /// </param>
    /// <param name="minSaltLen">
    /// Min size (in bytes) of randomly generated salt which will be added at
    /// the beginning of plain text before encryption is performed. When this
    /// value is less than 4, the default min value will be used (currently 4
    /// bytes).
    /// </param>
    /// <param name="maxSaltLen">
    /// Max size (in bytes) of randomly generated salt which will be added at
    /// the beginning of plain text before encryption is performed. When this
    /// value is negative or greater than 255, the default max value will be 
    /// used (currently 8 bytes). If max value is 0 (zero) or if it is smaller
    /// than the specified min value (which can be adjusted to default value),
    /// salt will not be used and plain text value will be encrypted as is.
    /// In this case, salt will not be processed during decryption either.
    /// </param>
    /// <param name="keySize">
    /// Size of symmetric key (in bits): 128, 192, or 256.
    /// </param>
    public RijndaelEnhanced(string  passPhrase,
                            string  initVector,
                            int     minSaltLen,
                            int     maxSaltLen,
                            int     keySize) :
        this(passPhrase, initVector, minSaltLen, maxSaltLen, keySize, null)
    {
    }
 
    /// <summary>
    /// Use this constructor if you are planning to perform encryption/
    /// decryption using the key derived from 1 password iteration, hashing 
    /// without salt, and cipher block chaining (CBC) mode.
    /// </summary>
    /// <param name="passPhrase">
    /// Passphrase from which a pseudo-random password will be derived.
    /// The derived password will be used to generate the encryption key.
    /// Passphrase can be any string. In this example we assume that the
    /// passphrase is an ASCII string. Passphrase value must be kept in
    /// secret.
    /// </param>
    /// <param name="initVector">
    /// Initialization vector (IV). This value is required to encrypt the
    /// first block of plaintext data. For RijndaelManaged class IV must be
    /// exactly 16 ASCII characters long. IV value does not have to be kept
    /// in secret.
    /// </param>
    /// <param name="minSaltLen">
    /// Min size (in bytes) of randomly generated salt which will be added at
    /// the beginning of plain text before encryption is performed. When this
    /// value is less than 4, the default min value will be used (currently 4
    /// bytes).
    /// </param>
    /// <param name="maxSaltLen">
    /// Max size (in bytes) of randomly generated salt which will be added at
    /// the beginning of plain text before encryption is performed. When this
    /// value is negative or greater than 255, the default max value will be
    /// used (currently 8 bytes). If max value is 0 (zero) or if it is smaller
    /// than the specified min value (which can be adjusted to default value),
    /// salt will not be used and plain text value will be encrypted as is.
    /// In this case, salt will not be processed during decryption either.
    /// </param>
    /// <param name="keySize">
    /// Size of symmetric key (in bits): 128, 192, or 256.
    /// </param>
    /// <param name="hashAlgorithm">
    /// Hashing algorithm: "MD5" or "SHA1". SHA1 is recommended.
    /// </param>
    public RijndaelEnhanced(string  passPhrase,
                            string  initVector,
                            int     minSaltLen,
                            int     maxSaltLen, 
                            int     keySize,
                            string  hashAlgorithm) : 
        this(passPhrase, initVector, minSaltLen, maxSaltLen, keySize, 
             hashAlgorithm, null)
    {
    }
 
    /// <summary>
    /// Use this constructor if you are planning to perform encryption/
    /// decryption using the key derived from 1 password iteration, and
    /// cipher block chaining (CBC) mode.
    /// </summary>
    /// <param name="passPhrase">
    /// Passphrase from which a pseudo-random password will be derived.
    /// The derived password will be used to generate the encryption key.
    /// Passphrase can be any string. In this example we assume that the
    /// passphrase is an ASCII string. Passphrase value must be kept in
    /// secret.
    /// </param>
    /// <param name="initVector">
    /// Initialization vector (IV). This value is required to encrypt the
    /// first block of plaintext data. For RijndaelManaged class IV must be
    /// exactly 16 ASCII characters long. IV value does not have to be kept
    /// in secret.
    /// </param>
    /// <param name="minSaltLen">
    /// Min size (in bytes) of randomly generated salt which will be added at
    /// the beginning of plain text before encryption is performed. When this
    /// value is less than 4, the default min value will be used (currently 4
    /// bytes).
    /// </param>
    /// <param name="maxSaltLen">
    /// Max size (in bytes) of randomly generated salt which will be added at
    /// the beginning of plain text before encryption is performed. When this
    /// value is negative or greater than 255, the default max value will be
    /// used (currently 8 bytes). If max value is 0 (zero) or if it is smaller
    /// than the specified min value (which can be adjusted to default value),
    /// salt will not be used and plain text value will be encrypted as is.
    /// In this case, salt will not be processed during decryption either.
    /// </param>
    /// <param name="keySize">
    /// Size of symmetric key (in bits): 128, 192, or 256.
    /// </param>
    /// <param name="hashAlgorithm">
    /// Hashing algorithm: "MD5" or "SHA1". SHA1 is recommended.
    /// </param>
    /// <param name="saltValue">
    /// Salt value used for password hashing during key generation. This is
    /// not the same as the salt we will use during encryption. This parameter
    /// can be any string.
    /// </param>
    public RijndaelEnhanced(string  passPhrase,
                            string  initVector,
                            int     minSaltLen,
                            int     maxSaltLen, 
                            int     keySize,
                            string  hashAlgorithm,
                            string  saltValue) : 
        this(passPhrase, initVector, minSaltLen, maxSaltLen, keySize, 
             hashAlgorithm, saltValue, 1)
    {
    }
 
    /// <summary>
    /// Use this constructor if you are planning to perform encryption/
    /// decryption with the key derived from the explicitly specified
    /// parameters.
    /// </summary>
    /// <param name="passPhrase">
    /// Passphrase from which a pseudo-random password will be derived.
    /// The derived password will be used to generate the encryption key
    /// Passphrase can be any string. In this example we assume that the
    /// passphrase is an ASCII string. Passphrase value must be kept in
    /// secret.
    /// </param>
    /// <param name="initVector">
    /// Initialization vector (IV). This value is required to encrypt the
    /// first block of plaintext data. For RijndaelManaged class IV must be
    /// exactly 16 ASCII characters long. IV value does not have to be kept
    /// in secret.
    /// </param>
    /// <param name="minSaltLen">
    /// Min size (in bytes) of randomly generated salt which will be added at
    /// the beginning of plain text before encryption is performed. When this
    /// value is less than 4, the default min value will be used (currently 4
    /// bytes).
    /// </param>
    /// <param name="maxSaltLen">
    /// Max size (in bytes) of randomly generated salt which will be added at
    /// the beginning of plain text before encryption is performed. When this
    /// value is negative or greater than 255, the default max value will be
    /// used (currently 8 bytes). If max value is 0 (zero) or if it is smaller
    /// than the specified min value (which can be adjusted to default value),
    /// salt will not be used and plain text value will be encrypted as is.
    /// In this case, salt will not be processed during decryption either.
    /// </param>
    /// <param name="keySize">
    /// Size of symmetric key (in bits): 128, 192, or 256.
    /// </param>
    /// <param name="hashAlgorithm">
    /// Hashing algorithm: "MD5" or "SHA1". SHA1 is recommended.
    /// </param>
    /// <param name="saltValue">
    /// Salt value used for password hashing during key generation. This is
    /// not the same as the salt we will use during encryption. This parameter
    /// can be any string.
    /// </param>
    /// <param name="passwordIterations">
    /// Number of iterations used to hash password. More iterations are
    /// considered more secure but may take longer.
    /// </param>
    public RijndaelEnhanced(string  passPhrase,
                            string  initVector,
                            int     minSaltLen,
                            int     maxSaltLen, 
                            int     keySize,
                            string  hashAlgorithm,
                            string  saltValue,
                            int     passwordIterations)
    {
        // Save min salt length; set it to default if invalid value is passed.
        if (minSaltLen < MIN_ALLOWED_SALT_LEN)
            this.minSaltLen = DEFAULT_MIN_SALT_LEN;
        else
            this.minSaltLen = minSaltLen;
 
        // Save max salt length; set it to default if invalid value is passed.
        if (maxSaltLen < 0 || maxSaltLen > MAX_ALLOWED_SALT_LEN)
            this.maxSaltLen = DEFAULT_MAX_SALT_LEN;
        else
            this.maxSaltLen = maxSaltLen;
 
        // Set the size of cryptographic key.
        if (keySize <= 0)
            keySize = DEFAULT_KEY_SIZE;
 
        // Set the name of algorithm. Make sure it is in UPPER CASE and does
        // not use dashes, e.g. change "sha-1" to "SHA1".
        if (hashAlgorithm == null)
            hashAlgorithm = DEFAULT_HASH_ALGORITHM;
        else
            hashAlgorithm = hashAlgorithm.ToUpper().Replace("-", "");
 
        // Initialization vector converted to a byte array.
        byte[] initVectorBytes = null;
 
        // Salt used for password hashing (to generate the key, not during
        // encryption) converted to a byte array.
        byte[] saltValueBytes  = null;
 
        // Get bytes of initialization vector.
        if (initVector == null)
            initVectorBytes = new byte[0];
        else
            initVectorBytes = Encoding.ASCII.GetBytes(initVector);
 
        // Get bytes of salt (used in hashing).
        if (saltValue == null)
            saltValueBytes = new byte[0];
        else
            saltValueBytes = Encoding.ASCII.GetBytes(saltValue);
 
        // Generate password, which will be used to derive the key.
        PasswordDeriveBytes password = new PasswordDeriveBytes(
                                                   passPhrase,
                                                   saltValueBytes,
                                                   hashAlgorithm,
                                                   passwordIterations);
 
        // Convert key to a byte array adjusting the size from bits to bytes.
        byte[] keyBytes = password.GetBytes(keySize / 8);
 
        // Initialize Rijndael key object.
        RijndaelManaged symmetricKey = new RijndaelManaged();
 
        // If we do not have initialization vector, we cannot use the CBC mode.
        // The only alternative is the ECB mode (which is not as good).
        if (initVectorBytes.Length == 0)
            symmetricKey.Mode = CipherMode.ECB;
        else
            symmetricKey.Mode = CipherMode.CBC;
 
        // Create encryptor and decryptor, which we will use for cryptographic
        // operations.
        encryptor = symmetricKey.CreateEncryptor(keyBytes, initVectorBytes);
        decryptor = symmetricKey.CreateDecryptor(keyBytes, initVectorBytes);
    }
    #endregion
 
    #region Encryption routines
    /// <summary>
    /// Encrypts a string value generating a base64-encoded string.
    /// </summary>
    /// <param name="plainText">
    /// Plain text string to be encrypted.
    /// </param>
    /// <returns>
    /// Cipher text formatted as a base64-encoded string.
    /// </returns>
    public string Encrypt(string plainText)
    {
        return Encrypt(Encoding.UTF8.GetBytes(plainText));
    }
 
    /// <summary>
    /// Encrypts a byte array generating a base64-encoded string.
    /// </summary>
    /// <param name="plainTextBytes">
    /// Plain text bytes to be encrypted.
    /// </param>
    /// <returns>
    /// Cipher text formatted as a base64-encoded string.
    /// </returns>
    public string Encrypt(byte[] plainTextBytes)
    {
        return Convert.ToBase64String(EncryptToBytes(plainTextBytes));
    }
 
    /// <summary>
    /// Encrypts a string value generating a byte array of cipher text.
    /// </summary>
    /// <param name="plainText">
    /// Plain text string to be encrypted.
    /// </param>
    /// <returns>
    /// Cipher text formatted as a byte array.
    /// </returns>
    public byte[] EncryptToBytes(string plainText)
    {
        return EncryptToBytes(Encoding.UTF8.GetBytes(plainText));
    }
 
    /// <summary>
    /// Encrypts a byte array generating a byte array of cipher text.
    /// </summary>
    /// <param name="plainTextBytes">
    /// Plain text bytes to be encrypted.
    /// </param>
    /// <returns>
    /// Cipher text formatted as a byte array.
    /// </returns>
    public byte[] EncryptToBytes(byte[] plainTextBytes)
    {
        // Add salt at the beginning of the plain text bytes (if needed).
        byte[] plainTextBytesWithSalt = AddSalt(plainTextBytes);
 
        // Encryption will be performed using memory stream.
        MemoryStream memoryStream = new MemoryStream();
        
        // Let's make cryptographic operations thread-safe.
        lock (this)
        {
            // To perform encryption, we must use the Write mode.
            CryptoStream cryptoStream = new CryptoStream(
                                               memoryStream, 
                                               encryptor,
                                                CryptoStreamMode.Write);
 
            // Start encrypting data.
            cryptoStream.Write( plainTextBytesWithSalt, 
                                0, 
                               plainTextBytesWithSalt.Length);
             
            // Finish the encryption operation.
            cryptoStream.FlushFinalBlock();
 
            // Move encrypted data from memory into a byte array.
            byte[] cipherTextBytes = memoryStream.ToArray();
               
            // Close memory streams.
            memoryStream.Close();
            cryptoStream.Close();
 
            // Return encrypted data.
            return cipherTextBytes;
        }
    }
    #endregion
 
    #region Decryption routines
    /// <summary>
    /// Decrypts a base64-encoded cipher text value generating a string result.
    /// </summary>
    /// <param name="cipherText">
    /// Base64-encoded cipher text string to be decrypted.
    /// </param>
    /// <returns>
    /// Decrypted string value.
    /// </returns>
    public string Decrypt(string cipherText)
    {
        return Decrypt(Convert.FromBase64String(cipherText));
    }
 
    /// <summary>
    /// Decrypts a byte array containing cipher text value and generates a
    /// string result.
    /// </summary>
    /// <param name="cipherTextBytes">
    /// Byte array containing encrypted data.
    /// </param>
    /// <returns>
    /// Decrypted string value.
    /// </returns>
    public string Decrypt(byte[] cipherTextBytes)
    {
        return Encoding.UTF8.GetString(DecryptToBytes(cipherTextBytes));
    }
 
    /// <summary>
    /// Decrypts a base64-encoded cipher text value and generates a byte array
    /// of plain text data.
    /// </summary>
    /// <param name="cipherText">
    /// Base64-encoded cipher text string to be decrypted.
    /// </param>
    /// <returns>
    /// Byte array containing decrypted value.
    /// </returns>
    public byte[] DecryptToBytes(string cipherText)
    {
        return DecryptToBytes(Convert.FromBase64String(cipherText));
    }
 
    /// <summary>
    /// Decrypts a base64-encoded cipher text value and generates a byte array
    /// of plain text data.
    /// </summary>
    /// <param name="cipherTextBytes">
    /// Byte array containing encrypted data.
    /// </param>
    /// <returns>
    /// Byte array containing decrypted value.
    /// </returns>
    public byte[] DecryptToBytes(byte[] cipherTextBytes)
    {
        byte[] decryptedBytes      = null;
        byte[] plainTextBytes      = null;
        int    decryptedByteCount  = 0;
        int    saltLen             = 0;
 
        MemoryStream memoryStream = new MemoryStream(cipherTextBytes);
 
        // Since we do not know how big decrypted value will be, use the same
        // size as cipher text. Cipher text is always longer than plain text
        // (in block cipher encryption), so we will just use the number of
        // decrypted data byte after we know how big it is.
        decryptedBytes = new byte[cipherTextBytes.Length];
 
        // Let's make cryptographic operations thread-safe.
        lock (this)
        {
            // To perform decryption, we must use the Read mode.
            CryptoStream  cryptoStream = new CryptoStream(
                                               memoryStream,
                                               decryptor,
                                               CryptoStreamMode.Read);
 
            // Decrypting data and get the count of plain text bytes.
            decryptedByteCount  = cryptoStream.Read(decryptedBytes,
                                                    0, 
                                                    decryptedBytes.Length);
            // Release memory.
            memoryStream.Close();
            cryptoStream.Close();
        }
 
        // If we are using salt, get its length from the first 4 bytes of plain
        // text data.
        if (maxSaltLen > 0 && maxSaltLen >= minSaltLen)
        {
            saltLen =   (decryptedBytes[0] & 0x03) |
                        (decryptedBytes[1] & 0x0c) |
                        (decryptedBytes[2] & 0x30) |
                        (decryptedBytes[3] & 0xc0);
        }
 
        // Allocate the byte array to hold the original plain text (without salt).
        plainTextBytes = new byte[decryptedByteCount - saltLen];
 
        // Copy original plain text discarding the salt value if needed.
        Array.Copy(decryptedBytes, saltLen, plainTextBytes, 
                    0, decryptedByteCount - saltLen);
 
        // Return original plain text value.
        return plainTextBytes;
    }
    #endregion
 
    #region Helper functions
    /// <summary>
    /// Adds an array of randomly generated bytes at the beginning of the
    /// array holding original plain text value.
    /// </summary>
    /// <param name="plainTextBytes">
    /// Byte array containing original plain text value.
    /// </param>
    /// <returns>
    /// Either original array of plain text bytes (if salt is not used) or a
    /// modified array containing a randomly generated salt added at the 
    /// beginning of the plain text bytes. 
    /// </returns>
    private byte[] AddSalt(byte[] plainTextBytes)
    {
        // The max salt value of 0 (zero) indicates that we should not use 
        // salt. Also do not use salt if the max salt value is smaller than
        // the min value.
        if (maxSaltLen == 0 || maxSaltLen < minSaltLen)
            return plainTextBytes;
 
        // Generate the salt.
        byte[] saltBytes = GenerateSalt();
 
        // Allocate array which will hold salt and plain text bytes.
        byte[] plainTextBytesWithSalt = new byte[plainTextBytes.Length +
                                                 saltBytes.Length];
        // First, copy salt bytes.
        Array.Copy(saltBytes, plainTextBytesWithSalt, saltBytes.Length);
 
        // Append plain text bytes to the salt value.
        Array.Copy( plainTextBytes, 0, 
                    plainTextBytesWithSalt, saltBytes.Length,
                    plainTextBytes.Length);
 
        return plainTextBytesWithSalt;
    }
 
    /// <summary>
    /// Generates an array holding cryptographically strong bytes.
    /// </summary>
    /// <returns>
    /// Array of randomly generated bytes.
    /// </returns>
    /// <remarks>
    /// Salt size will be defined at random or exactly as specified by the
    /// minSlatLen and maxSaltLen parameters passed to the object constructor.
    /// The first four bytes of the salt array will contain the salt length
    /// split into four two-bit pieces.
    /// </remarks>
    private byte[] GenerateSalt()
    {
        // We don't have the length, yet.
        int saltLen = 0;
 
        // If min and max salt values are the same, it should not be random.
        if (minSaltLen == maxSaltLen)
            saltLen = minSaltLen;
        // Use random number generator to calculate salt length.
        else
            saltLen = GenerateRandomNumber(minSaltLen, maxSaltLen);
 
        // Allocate byte array to hold our salt.
        byte[] salt = new byte[saltLen];
 
        // Populate salt with cryptographically strong bytes.
        RNGCryptoServiceProvider rng = new RNGCryptoServiceProvider();
 
        rng.GetNonZeroBytes(salt);
 
        // Split salt length (always one byte) into four two-bit pieces and
        // store these pieces in the first four bytes of the salt array.
        salt[0] = (byte)((salt[0] & 0xfc) | (saltLen & 0x03));
        salt[1] = (byte)((salt[1] & 0xf3) | (saltLen & 0x0c));
        salt[2] = (byte)((salt[2] & 0xcf) | (saltLen & 0x30));
        salt[3] = (byte)((salt[3] & 0x3f) | (saltLen & 0xc0));
 
        return salt;
    }
 
    /// <summary>
    /// Generates random integer.
    /// </summary>
    /// <param name="minValue">
    /// Min value (inclusive).
    /// </param>
    /// <param name="maxValue">
    /// Max value (inclusive).
    /// </param>
    /// <returns>
    /// Random integer value between the min and max values (inclusive).
    /// </returns>
    /// <remarks>
    /// This methods overcomes the limitations of .NET Framework's Random
    /// class, which - when initialized multiple times within a very short
    /// period of time - can generate the same "random" number.
    /// </remarks>
    private int GenerateRandomNumber(int minValue, int maxValue)
    {
        // We will make up an integer seed from 4 bytes of this array.
        byte[] randomBytes = new byte[4];
 
        // Generate 4 random bytes.
        RNGCryptoServiceProvider rng = new RNGCryptoServiceProvider();
        rng.GetBytes(randomBytes);
 
        // Convert four random bytes into a positive integer value.
        int seed = ((randomBytes[0] & 0x7f) << 24) |
                    (randomBytes[1]         << 16) |
                    (randomBytes[2]         << 8 ) |
                    (randomBytes[3]);
 
        // Now, this looks more like real randomization.
        Random  random  = new Random(seed);
 
        // Calculate a random number.
        return random.Next(minValue, maxValue+1);
    }
    #endregion
}
 

/*
    [STAThread]
    static void Main(string[] args)
    {
        string  plainText  = "Hello, World!";    // original plaintext
        string  cipherText = "";                 // encrypted text
        string  passPhrase = "Pas5pr@se";        // can be any string
        string  initVector = "@1B2c3D4e5F6g7H8"; // must be 16 bytes
 
        // Before encrypting data, we will append plain text to a random
        // salt value, which will be between 4 and 8 bytes long (implicitly
        // used defaults).
        RijndaelEnhanced rijndaelKey = 
            new RijndaelEnhanced(passPhrase, initVector);
 
        Console.WriteLine(String.Format("Plaintext   : {0}\n", plainText));
 
        // Encrypt the same plain text data 10 time (using the same key,
        // initialization vector, etc) and see the resulting cipher text;
        // encrypted values will be different.
        for (int i=0; i<10; i++)
        {
            cipherText =rijndaelKey.Encrypt(plainText);
            Console.WriteLine(
                String.Format("Encrypted #{0}: {1}", i, cipherText));
            plainText =rijndaelKey.Decrypt(cipherText);
        }
 
        // Make sure we got decryption working correctly.
        Console.WriteLine(String.Format("\nDecrypted   :{0}", plainText));
    }

*/
}
