```{=html}

<%
// Change these two lines to reuse the template for another month.
const YEAR = 2026, MONTH = 10; // MONTH is zero-based: 10 = November

const byDay = {};
for (const item of items) {
  const m = String(item.date || "").match(/^(\d{4})-(\d{2})-(\d{2})/);
  if (!m || +m[1] !== YEAR || +m[2] !== MONTH + 1) continue;
  (byDay[+m[3]] = byDay[+m[3]] || []).push(item);
}
const firstWeekday = new Date(Date.UTC(YEAR, MONTH, 1)).getUTCDay(); // 0 = Sunday
const daysInMonth = new Date(Date.UTC(YEAR, MONTH + 1, 0)).getUTCDate();
const totalCells = Math.ceil((firstWeekday + daysInMonth) / 7) * 7;
const weekdays = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
%>
<div class="cal">
  <div class="cal-weekdays" aria-hidden="true">
    <% for (const w of weekdays) { %><div><%= w %></div><% } %>
  </div>
  <ol class="cal-grid">
    <% for (let i = 0; i < totalCells; i++) {
         const day = i - firstWeekday + 1;
         if (day < 1 || day > daysInMonth) { %>
      <li class="cal-cell cal-blank" aria-hidden="true"></li>
    <%   continue; }
         const entries = byDay[day] || [];
         const e = entries[0]; %>
      <% if (e) { %>
      <li class="cal-cell cal-has-map">
        <a href="<%= e.path %>" title="<%= e.title %>">
          <% if (e.image) { %><img src="<%= e.image %>" alt="<%= e.title %>" loading="lazy"><% } %>
          <span class="cal-day"><%= day %></span>
          <% if (entries.length > 1) { %><span class="cal-more">+<%= entries.length - 1 %></span><% } %>
          <span class="cal-caption"><%= e.title %></span>
        </a>
      </li>
      <% } else { %>
      <li class="cal-cell"><span class="cal-day"><%= day %></span></li>
      <% } %>
    <% } %>
  </ol>
</div>

```