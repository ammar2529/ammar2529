using System;
using System.Collections.Generic;
using System.Web;

/// <summary>
/// Summary description for StaticCache
/// </summary>
namespace WebProject.AsyncWidgets.Utility
{
    public class StaticCache
    {
        private static Dictionary<string, Dictionary<string, object>> CacheDic = new Dictionary<string, Dictionary<string, object>>();

        public static object GetCachedItem(string GroupId, string ItemId)
        {
            Dictionary<string, object> CacheItems;
            if (!StaticCache.CacheDic.ContainsKey(GroupId))
            {
                return null;
            }
            else
            {
                CacheItems = StaticCache.CacheDic[GroupId];
            }
            if (!CacheItems.ContainsKey(ItemId))
            {
                return null;
            }
            else
            {
                return CacheItems[ItemId];
            }
        }
        public static void SetCachedItem(string GroupId, string ItemId, object Item)
        {
            Dictionary<string, object> CacheItems;
            if (!StaticCache.CacheDic.ContainsKey(GroupId))
            {
                CacheItems = new Dictionary<string, object>();
                StaticCache.CacheDic.Add(GroupId, CacheItems);
            }
            else
            {
                CacheItems = StaticCache.CacheDic[GroupId];
            }
            if (!CacheItems.ContainsKey(ItemId))
            {
                CacheItems.Add(ItemId, Item);

            }
            else
            {
                CacheItems.Remove(ItemId);
                CacheItems.Add(ItemId, Item);

            }
        }
        public static bool HasItem(string GroupId, string ItemId)
        {
            return StaticCache.CacheDic.ContainsKey(GroupId) ?
                          StaticCache.CacheDic[GroupId].ContainsKey(ItemId) :
                          false;
        }
    }
}