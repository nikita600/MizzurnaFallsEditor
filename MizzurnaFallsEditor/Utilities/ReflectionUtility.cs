using System;
using System.Collections.Generic;
using System.Reflection;

namespace MizzurnaFallsEditor.Utilities
{
    public static class ReflectionUtility
    {
        public static Dictionary<T, Type> GetTypesWithAttribute<T>() where T : Attribute
        {
            var typesWithAttributes = new Dictionary<T, Type>();
            
            var types = GetTypes();
            foreach (var type in types)
            {
                var customAttribute = type.GetCustomAttribute<T>();
                if (customAttribute != null && !typesWithAttributes.ContainsKey(customAttribute))
                {
                    typesWithAttributes.Add(customAttribute, type);
                }
            }

            return typesWithAttributes;
        }
        
        private static IEnumerable<Type> GetTypes()
        {
            var types = new List<Type>();

            var assemblies = AppDomain.CurrentDomain.GetAssemblies();
            foreach (var assembly in assemblies)
            {
                types.AddRange(assembly.GetTypes());
            }
            
            return types;
        }
    }
}