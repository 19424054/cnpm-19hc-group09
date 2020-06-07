using DevExpress.XtraGrid;
using DevExpress.XtraGrid.Views.Grid;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyMuaBanXe.myClasses
{
    class Tools
    {
        public static int FindRowHandleByRowObject(DataTable dataTable, GridView view, object rowMonth, object rowYear)
        {
            if (rowMonth != null && rowYear != null)
            {


                DataRow[] tmp = dataTable.Select(string.Format("month = {0} and year = {1}", rowMonth, rowYear));
                if (tmp.Length > 0)
                {
                    int handle = view.GetRowHandle(dataTable.Rows.IndexOf(tmp[0]));
                    return handle;
                }

            }
            return GridControl.InvalidRowHandle;
        }
    }
}
