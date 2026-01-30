import { createServerFn } from '@tanstack/react-start';



export const getCurrentTime = createServerFn()
    .handler(() => {
        const now = new Date()
        return {
            iso: now.toISOString(),
            formatted: now.toLocaleString('en-GB', {
                day: 'numeric',
                month: 'short',
                year: 'numeric',
                hour: 'numeric',
                minute: '2-digit',
                hour12: true,
            }),
        }
    })




export async function getWeeklyRange() {
    const currentTime = await getCurrentTime();

    const today = new Date(currentTime.iso);
    const oneWeekLater = new Date(today);
    oneWeekLater.setDate(today.getDate() + 7);

    const formatDate = (date: Date) =>
        date.toLocaleDateString("en-US", { month: "short", day: "numeric" });

    const dateRange = `${formatDate(today)} - ${formatDate(oneWeekLater)}`;
    return dateRange;
}