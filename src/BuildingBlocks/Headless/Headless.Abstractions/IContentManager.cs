using Headless.Abstractions.Models;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Text;

namespace Headless.Abstractions
{
    public interface IContentManager
    {
        ContentItem GetContentItem(string id, CultureInfo culture);
    }
}
