using System;
using System.Runtime.Caching;

namespace WebProject
{
    public class NewStaticCache
    {
        private static MemoryCache _cache = MemoryCache.Default;

        public static void AddToCache(string key, object value)
        {
            _cache.Add(key, value, DateTimeOffset.Now.AddMinutes(30));
        }

        public static object GetFromCache(string key)
        {
            return _cache.Get(key);
        }

        public static void RemoveFromCache(string key)
        {
            _cache.Remove(key);
        }
    }
}